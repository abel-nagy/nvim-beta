local plugin_view = require('plugin-view')

plugin_view.setup({
    win = {
        border = 'rounded'
    }
})

vim.keymap.set('n', '<Leader>P', function () plugin_view.open() end, { desc = 'Open Plugin View', noremap = true, silent = true })
