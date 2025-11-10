local oil = require('oil')

---@module 'oil'
---@type oil.SetupOpts
local opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
            return name == '..' or name == '.git'
        end
    },
    columns = {
        'icon'
    },
    keymaps = {
        ['<C-h>'] = false, -- Disable Oil's default mapping for 'Ctrl+h' in favor of 'Moving to left window'
        ['<C-l>'] = false -- Disable Oil's default mapping for 'Ctrl+l' in favor of 'Moving to right window'
    }
}
oil.setup(opts)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
