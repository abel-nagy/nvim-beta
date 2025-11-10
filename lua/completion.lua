vim.pack.add({
    { src = 'https://github.com/Saghen/blink.cmp', version = 'v1.7.0' },
    { src = 'https://github.com/L3MON4D3/LuaSnip' },
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
})

---@module 'blink.cmp'
---@type blink.cmp.Config
local opts = {
    appearance = { use_nvim_cmp_as_default = false },
    completion = {
        keyword = { range = 'full' },
        documentation = {
            auto_show = true,
            treesitter_highlighting = true
        },
        accept = { auto_brackets = { enabled = true } },
        ghost_text = { enabled = false },
        list = { selection = { auto_insert = false } }
    },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    signature = {
        enabled = true,
        window = {
            border = 'rounded',
            show_documentation = false
        }
    },
    cmdline = {
        keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } }
    },
    snippets = {
        preset = 'luasnip'
    }
}

require('blink.cmp').setup(opts)
