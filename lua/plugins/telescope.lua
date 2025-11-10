vim.pack.add({
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim' }
})

require('plenary')
local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

vim.keymap.set('n', 'fh', builtin.help_tags, { desc = 'Find Help', noremap = true, silent = true })
vim.keymap.set('n', 'ff', builtin.find_files, { desc = 'Find Files', noremap = true, silent = true })

telescope.setup({
    defaults = {
        path_display = { 'smart' }
    },
    pickers = {
        help_tags = {
            attach_mappings = function(prompt_bufnr, map)
                local function open_floating_help()
                    local entry = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)

                    if entry and entry.value then
                        vim.cmd('FloatingHelp ' .. entry.value)
                    end
                end

                map('i', '<CR>', open_floating_help)
                map('n', '<CR>', open_floating_help)
                return true
            end
        }
    }
})
