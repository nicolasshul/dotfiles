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
