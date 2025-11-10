vim.pack.add{ 'https://github.com/mbbill/undotree' }
vim.keymap.set('n', '<Leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle Undotree', noremap = true, silent = true })
