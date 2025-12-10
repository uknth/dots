# Testing if cursor-agent loads agents.md or .cursorrules

## Test 1: Create .cursorrules in workspace

1. In your project directory, create `.cursorrules`:

```bash
cd /path/to/your/project
cat > .cursorrules << 'EOF'
You are a helpful coding assistant.

When responding:
- Always start your response with "🤖 CURSORRULES ACTIVE"
- Be concise and practical
- Use examples when helpful
EOF
```

2. Start cursor-agent from that directory:
```bash
cursor-agent
```

3. Ask a simple question like "help me with this code"

4. **If you see "🤖 CURSORRULES ACTIVE" in the response**, it's working!

---

## Test 2: Create agents.md in workspace

1. Create `agents.md` in your project:

```bash
cd /path/to/your/project
cat > agents.md << 'EOF'
# Agent Instructions

When writing code:
- Always add comments explaining complex logic
- Use descriptive variable names
- Start responses with "📝 AGENTS.MD LOADED"
EOF
```

2. Start cursor-agent and test if it follows these instructions

---

## Test 3: Configure in Neovim

If cursor-agent doesn't automatically load these files, you can:

### Option A: Pass workspace explicitly

Edit `lua/plugins/ai.lua` and add the workspace flag:

```lua
{
  name = "cursor-agent",
  cmd = "cursor-agent",
  args = { "--workspace", vim.fn.getcwd() },
}
```

### Option B: Send context manually

Use the existing keymaps to send context:
- `<leader>af` - Send entire file
- `<leader>at` - Send selection
- You could also send .cursorrules content first

### Option C: Create a custom prompt that includes instructions

```lua
{
  name = "cursor-agent-with-rules",
  cmd = "cursor-agent",
  args = { "@.cursorrules" },  -- If supported
}
```

---

## Recommended Approach

Based on cursor-agent's design, here's what I recommend:

### 1. Use `.cursorrules` in project root

cursor-agent (being a Cursor product) likely respects `.cursorrules` when:
- Started from the project directory
- Using `--workspace` flag

### 2. Verify by testing

Run the Test 1 above to confirm behavior.

### 3. If not automatic, send context manually

You already have great keymaps:
- `<leader>af` - Send current file
- `<leader>at` - Send selection

You could create a keymap to send `.cursorrules` first:

```lua
vim.keymap.set("n", "<leader>ar", function()
  require("sidekick.cli").send({ 
    msg = "{file:.cursorrules}" 
  })
end, { desc = "Send .cursorrules to Agent" })
```

---

## Quick Verification

Run this in your terminal:

```bash
# Create test project
mkdir -p /tmp/cursor-test
cd /tmp/cursor-test

# Create .cursorrules
echo "Start all responses with TEST_MARKER_12345" > .cursorrules

# Start cursor-agent
cursor-agent

# Then ask: "hello, can you help me?"
# If response contains TEST_MARKER_12345, it's reading .cursorrules!
```

---

Let me know what you find! This will help us configure it properly.
