vim.g.mapleader = ' '

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

------------------------ Normal mode ------------------------

map('n', '<Space><Space>', '<cmd>nohlsearch<CR>', opts)
map('n', 'W', '<cmd>w<CR>', { desc = 'Save file', noremap = true, silent = true })
map('n', 'Q', '<cmd>q<CR>', { desc = 'Close current pane', noremap = true, silent = true })

-- TIP: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>', opts)
map('i', '<left>', '<cmd>echo "Use h to move!!"<CR>', opts)
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>', opts)
map('i', '<right>', '<cmd>echo "Use l to move!!"<CR>', opts)
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>', opts)
map('i', '<up>', '<cmd>echo "Use k to move!!"<CR>', opts)
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>', opts)
map('i', '<down>', '<cmd>echo "Use j to move!!"<CR>', opts)

-- Keybinds to make split navigation easier.
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window', noremap = true, silent = true })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window', noremap = true, silent = true })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window', noremap = true, silent = true })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window', noremap = true, silent = true })

-- Resize with arrows
-- delta: 2 lines
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

map('n', '<leader>h', ':split<CR>', { desc = 'Horizontal split', noremap = true, silent = true })
map('n', '<leader>v', ':vsplit<CR>', { desc = 'Vertical split', noremap = true, silent = true })

------------------------ Visual mode ------------------------

-- Hint: start visual mode with the same area as the previous area and the same mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
