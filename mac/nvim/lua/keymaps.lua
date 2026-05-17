-- Toggle expandtab
vim.keymap.set('n', '<leader>et', function()
  vim.opt.expandtab = not vim.opt.expandtab:get()

  if vim.opt.expandtab:get() then
    print("expandtab: ON (spaces)")
  else
    print("expandtab: OFF (tabs)")
  end
end, { desc = "Toggle expandtab (tabs vs. spaces)" })

-- Remove highlighting during basic search ('/')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Clear search highlights" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})

vim.keymap.set("n", "<leader>i", "<cmd>Inspect<CR>", {
	desc = "Inspect highlight groups / Treesitter / LSP tokens",
})


