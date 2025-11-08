local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local group = augroup("UserAutocmds", {})

-- Highlight yanked text
autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
    end
})
