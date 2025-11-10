vim.pack.add({
    -- Dependencies
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-mini/mini.icons' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/MunifTanjim/nui.nvim' },        -- Doesn't require setup
    -- LSP
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
    -- Completion
    { src = 'https://github.com/L3MON4D3/LuaSnip' },
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
    { src = 'https://github.com/Saghen/blink.cmp', version = 'v1.7.0' },
    -- UI/Visual
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
    { src = 'https://github.com/goolord/alpha-nvim' },
    { src = 'https://github.com/rcarriga/nvim-notify' },
    { src = 'https://github.com/mluders/comfy-line-numbers.nvim' },
    { src = 'https://github.com/Tyler-Barham/floating-help.nvim' },
    { src = 'https://github.com/brenoprata10/nvim-highlight-colors' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/folke/noice.nvim' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/adriankarlen/plugin-view.nvim' },
    { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
    { src = 'https://github.com/folke/todo-comments.nvim'},     
    { src = 'https://github.com/mbbill/undotree' },
    { src = 'https://github.com/folke/which-key.nvim' },
    -- QoL
    { src = 'https://github.com/max397574/colortils.nvim' },
    { src = 'https://github.com/shoukoo/commentary.nvim' },     -- Doesn't require setup
    { src = 'https://github.com/windwp/nvim-autopairs' },
    { src = 'https://github.com/sitiom/nvim-numbertoggle' },    -- Doesn't require setup
    -- Misc
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/ptdewey/pendulum-nvim' },
    { src = 'https://github.com/epwalsh/pomo.nvim' },
})

-- Set up dependencies
require('plenary')
require('mini.icons').setup()
require('nvim-web-devicons').setup()

require('lsp')
require('completion')

require('plugins.nvim-treesitter')
vim.notify = require('notify')
require('noice').setup()
require('plugins.alpha')
require('plugins.lualine')
require('plugins.oil')
require('render-markdown').setup()
require('plugins.todo-comments')
require('comfy-line-numbers').setup()
require('plugins.floating-help')
require('nvim-highlight-colors').setup({})
require('plugins.plugin-view')
vim.keymap.set('n', '<Leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle Undotree', noremap = true, silent = true })
require('plugins.which-key')

require('colortils').setup()
require("nvim-autopairs").setup()

require('plugins.telescope')
require('pendulum').setup()
require('plugins.pomodoro')
