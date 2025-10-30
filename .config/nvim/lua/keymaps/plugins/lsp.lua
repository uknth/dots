
local map = require("utils.keymap").safe_set

map("n", "gd", vim.lsp.buf.definition, {desc = "Goto Definition"})
map("n", "gr", vim.lsp.buf.references, {desc = "Goto References"})
map("n", "gI", vim.lsp.buf.implementation, {desc = "Goto Implementation"})
map("n", "gy", vim.lsp.buf.type_definition, {desc = "Goto T[y]pe Definition" })
map("n", "gD", vim.lsp.buf.declaration, {desc = "Goto Declaration" })
map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code Action"})
map("n", "<leader>cc", vim.lsp.codelens.run, {desc = "Run Codelens"})

local ok, ttsc = pcall(require, "telescope.builtin")

if ok then
    map("n", "<leader>ls", ttsc.lsp_document_symbols, { desc = "Document symbols" })
    map("n", "gr", ttsc.lsp_references,{ desc = "Goto References" })
end


