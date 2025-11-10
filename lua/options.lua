local options = vim.opt

------------------------ Indentation ------------------------
options.expandtab = true
options.shiftwidth = 4
options.tabstop = 4
options.softtabstop = 4
options.smartindent = true
options.breakindent = true
options.autoindent = true

------------------------ Behavior ------------------------
options.clipboard = 'unnamedplus'
options.completeopt = { 'menu', 'menuone', 'noselect' }
options.mouse = ''
options.swapfile = false
options.backup = false
options.undofile = true
options.updatetime = 250
options.timeoutlen = 300
options.ignorecase = true
options.smartcase = true
options.confirm = true
options.encoding = 'utf-8'
options.fileencoding = 'utf-8'
options.inccommand = 'nosplit'
options.wrap = false
options.backspace = { 'start', 'eol', 'indent' }
options.isfname:append('@-@')
options.updatetime = 50
options.colorcolumn = '80'

------------------------ Visual ------------------------
options.termguicolors = true
options.number = true
options.showmode = false
options.relativenumber = true
options.signcolumn = 'yes'
options.cursorline = true
options.scrolloff = 8
options.sidescrolloff = 8
options.splitbelow = true
options.splitright = true
options.hlsearch = false
options.winborder = 'rounded'
vim.g.have_nerd_font = true
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

-- 'Hide' end of buffer uglyness ('~' character on all lines)
options.fillchars = { eob = ' ' }

--  Sets how Neovim will display certain whitespace characters
options.list = true
options.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
