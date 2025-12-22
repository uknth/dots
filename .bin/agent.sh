#!/bin/bash
#
# agent.sh - Launch AI agents with custom system prompts
#
# Usage: agent.sh [options] <agent> [agent args...]
#
# All agents use ~/.agent/system-prompt as the source for custom instructions.
#
# Supported agents:
#   claude       - Uses --append-system-prompt CLI flag
#   copilot      - Copies prompt to ~/.copilot/instructions.md before launch
#   cursor-agent - Copies prompt to .cursor/rules if in workspace directory
#
# Environment variables for custom binary paths:
#   CLAUDE_BIN       - Path to claude binary (default: claude from PATH)
#   COPILOT_BIN      - Path to copilot binary (default: copilot from PATH)
#   CURSOR_AGENT_BIN - Path to cursor-agent binary (default: cursor-agent from PATH)
#

set -e

SYSTEM_PROMPT_FILE="$HOME/.agent/system-prompt"
WORKSPACE_DIR="$HOME/Workspace"

# Binary paths (use environment variables or fall back to PATH)
CLAUDE_BIN="${CLAUDE_BIN:-claude}"
COPILOT_BIN="${COPILOT_BIN:-copilot}"
CURSOR_AGENT_BIN="${CURSOR_AGENT_BIN:-cursor-agent}"

show_help() {
    echo "Usage: agent.sh [options] <agent> [agent args...]"
    echo ""
    echo "Launch AI agents with custom system prompts from ~/.agent/system-prompt"
    echo ""
    echo "Options:"
    echo "  --workspace-dir <dir>  Set workspace directory for cursor-agent (default: ~/Workspace)"
    echo "  -h, --help             Show this help message"
    echo ""
    echo "Supported agents:"
    echo "  claude        - Uses --append-system-prompt CLI flag"
    echo "  copilot       - Syncs prompt to ~/.copilot/instructions.md"
    echo "  cursor-agent  - Syncs prompt to .cursor/rules (only in workspace dir)"
    echo ""
    echo "Environment variables:"
    echo "  CLAUDE_BIN       - Path to claude binary (current: $CLAUDE_BIN)"
    echo "  COPILOT_BIN      - Path to copilot binary (current: $COPILOT_BIN)"
    echo "  CURSOR_AGENT_BIN - Path to cursor-agent binary (current: $CURSOR_AGENT_BIN)"
    echo ""
    echo "Examples:"
    echo "  agent.sh claude"
    echo "  agent.sh claude -p \"explain this code\""
    echo "  agent.sh copilot"
    echo "  agent.sh cursor-agent"
    echo "  agent.sh --workspace-dir ~/Projects cursor-agent"
    echo "  CLAUDE_BIN=/usr/local/bin/claude agent.sh claude"
}

has_system_prompt() {
    # Return true only if file exists and is non-empty
    [[ -f "$SYSTEM_PROMPT_FILE" && -s "$SYSTEM_PROMPT_FILE" ]]
}

check_binary() {
    local bin="$1"
    local name="$2"

    if [[ "$bin" == /* ]] || [[ "$bin" == ./* ]]; then
        # Absolute or relative path - check if file exists and is executable
        if [[ ! -x "$bin" ]]; then
            echo "Error: $name binary not found or not executable at $bin"
            exit 1
        fi
    else
        # Just a command name - check if it's in PATH
        if ! command -v "$bin" &> /dev/null; then
            echo "Error: $name ($bin) is not installed or not in PATH"
            exit 1
        fi
    fi
}

launch_claude() {
    check_binary "$CLAUDE_BIN" "claude"

    if has_system_prompt; then
        system_prompt=$(cat "$SYSTEM_PROMPT_FILE")
        exec "$CLAUDE_BIN" --append-system-prompt "$system_prompt" "$@"
    else
        exec "$CLAUDE_BIN" "$@"
    fi
}

launch_copilot() {
    check_binary "$COPILOT_BIN" "copilot"

    if has_system_prompt; then
        mkdir -p "$HOME/.copilot"
        cp "$SYSTEM_PROMPT_FILE" "$HOME/.copilot/instructions.md"
    fi

    exec "$COPILOT_BIN" "$@"
}

launch_cursor_agent() {
    check_binary "$CURSOR_AGENT_BIN" "cursor-agent"

    if has_system_prompt; then
        # Get the real path of current directory and workspace
        current_dir=$(pwd -P)
        workspace_real=$(realpath "$WORKSPACE_DIR" 2>/dev/null || echo "$WORKSPACE_DIR")

        # Only sync if current directory is inside workspace
        if [[ "$current_dir" == "$workspace_real"* ]]; then
            mkdir -p .cursor
            cp "$SYSTEM_PROMPT_FILE" .cursor/rules
        fi
    fi

    exec "$CURSOR_AGENT_BIN" "$@"
}

# Parse global options
while [[ $# -gt 0 ]]; do
    case "$1" in
        --workspace-dir)
            if [[ -z "$2" ]]; then
                echo "Error: --workspace-dir requires a directory argument"
                exit 1
            fi
            WORKSPACE_DIR="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        -*)
            # Unknown option, might be agent-specific
            break
            ;;
        *)
            # Not an option, must be the agent name
            break
            ;;
    esac
done

if [[ $# -eq 0 ]]; then
    show_help
    exit 0
fi

agent="$1"
shift

case "$agent" in
    claude)
        launch_claude "$@"
        ;;
    copilot)
        launch_copilot "$@"
        ;;
    cursor-agent|cursor)
        launch_cursor_agent "$@"
        ;;
    *)
        echo "Error: Unknown agent '$agent'"
        echo ""
        show_help
        exit 1
        ;;
esac
