vim.pack.add({ 'https://github.com/adriankarlen/plugin-view.nvim' })
local plugin_view = require('plugin-view')
local options = {
    win = {
        border = 'rounded'
    }
}
plugin_view.setup(options)
vim.keymap.set('n', '<Leader>P', function () plugin_view.open() end, { desc = 'Open Plugin View', noremap = true, silent = true })
