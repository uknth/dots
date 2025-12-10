# cursor-agent Configuration Guide

## Confirmed: cursor-agent is CLI-Only

After checking `cursor-agent --help`, we confirmed:
- ✅ Interactive chat mode
- ✅ Scripting mode (`--print`)
- ❌ **No LSP support**
- ❌ **No inline completions**

## Current Setup Status

**✅ Working Now:**
- cursor-agent CLI integration for interactive AI assistance
- Press `<C-.>` or `<leader>aa` to open the chat
- Full context sharing via keymaps

**❌ Not Available:**
- Inline predictions (cursor-agent doesn't support this)

## Architecture Overview

**sidekick.nvim** provides two separate features:

1. **NES (Next Edit Suggestions)** - Inline code completions
   - Requires an **LSP provider** (like Copilot LSP)
   - Shows real-time suggestions as you type
   - cursor-agent doesn't support this ❌

2. **CLI Agents** - Interactive AI chat
   - Works with **CLI tools** like cursor-agent
   - Opens in a terminal for interactive editing
   - Currently configured and working ✅

## Your Options

### Option 1: Current Setup - CLI Only (Simple)

**What you have:** cursor-agent for interactive AI assistance

**How to use:**
- `<C-.>` or `<leader>aa` - Toggle cursor-agent CLI
- `<leader>as` - Select agent
- `<leader>at` - Send selection to agent
- `<leader>af` - Send file to agent
- `<leader>av` - Send visual selection to agent
- `<leader>ap` - Select prompt

**Pros:**
- ✅ Already configured and working
- ✅ More intentional, less distracting
- ✅ Full cursor-agent features

**Cons:**
- ❌ No automatic inline predictions

**Recommendation:** Great for focused, thoughtful AI assistance. No additional setup needed!

---

### Option 2: Hybrid Setup (Recommended for Inline Predictions)

**What you get:**
- **Copilot LSP** → Real-time inline completions (fast, context-aware)
- **cursor-agent** → Interactive AI chat for complex edits

#### Setup Instructions:

1. **Edit `lua/plugins/ai.lua`** - Uncomment the Copilot section:
   - Find the `-- OPTIONAL: Uncomment for inline predictions` section
   - Uncomment the `copilot.lua` plugin block
   - Uncomment the `requires` line in sidekick config
   - Change `nes.enabled` from `false` to `true`

2. **Restart Neovim** to install the plugin:
   ```bash
   nvim
   ```

3. **Authenticate with Copilot**:
   ```vim
   :Copilot auth
   ```
   Follow the prompts to authenticate with GitHub.

4. **Uncomment NES keymaps** in `lua/plugins/ai.lua`:
   - Find the commented NES keymaps section
   - Uncomment the keymaps you want

5. **Restart Neovim** again

#### Usage:
- As you type → **Copilot** shows inline suggestions (gray text)
- Accept: `<M-l>` (Alt+L)
- Dismiss: `<M-e>` (Alt+E)
- Manual trigger: `<C-Space>`
- For complex edits → Open **cursor-agent** with `<C-.>`

**Pros:**
- ✅ Fast inline completions
- ✅ Keep cursor-agent for complex tasks
- ✅ Best of both worlds

**Cons:**
- ❌ Requires GitHub Copilot subscription
- ❌ Additional plugin dependency

---

### Option 3: Build a Custom LSP Wrapper (Advanced)

Create a custom LSP server that wraps cursor-agent's `--print` mode:

1. Listens for LSP completion requests
2. Calls `cursor-agent --print` with context
3. Parses output and returns as LSP completions

**Pros:**
- ✅ Native cursor-agent integration
- ✅ No additional subscriptions

**Cons:**
- ❌ Requires significant development work
- ❌ cursor-agent `--print` mode is designed for scripts, not real-time completions
- ❌ Would likely be slow (cursor-agent wasn't designed for this)

**Recommendation:** Not worth the effort. Use Option 2 instead.

---

## My Recommendation

**For most users:** Start with **Option 1** (current CLI-only setup)

**If you want inline predictions:** Add **Option 2** (hybrid with Copilot)

### Why?

1. **cursor-agent** excels at interactive, contextual assistance
2. **Copilot** excels at fast inline completions
3. They complement each other perfectly
4. No need to fight against cursor-agent's design

---

## cursor-agent CLI Features

Your current setup supports all cursor-agent features:

```bash
# Available flags you can add to the agent config:
--model <model>      # e.g., gpt-5, sonnet-4, sonnet-4-thinking
--cloud              # Start in cloud mode
--browser            # Enable browser automation
--workspace <path>   # Set workspace directory
--force              # Force allow commands
```

Example: Add to `lua/plugins/ai.lua`:

```lua
cli = {
  agents = {
    {
      name = "cursor-agent",
      cmd = "cursor-agent",
      args = { "--model", "sonnet-4" },  -- Use specific model
    },
  },
}
```

---

## Summary

| Feature | cursor-agent | Copilot (optional) |
|---------|--------------|-------------------|
| **Inline predictions** | ❌ No | ✅ Yes |
| **Interactive chat** | ✅ Yes | ❌ No |
| **Context-aware edits** | ✅ Yes | Limited |
| **Browser automation** | ✅ Yes | ❌ No |
| **Model selection** | ✅ Yes | ❌ No |
| **Subscription required** | Cursor subscription | GitHub Copilot subscription |

**Current status:** ✅ cursor-agent CLI fully configured and working
