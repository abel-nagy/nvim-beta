vim.pack.add({
    { src = 'https://github.com/Saghen/blink.cmp' }
})

require('blink.cmp').setup({
    keymap = { preset = 'default' },
    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant ='mono',
    },
    completion = {
        documentation = { auto_show = true },
        accept = { auto_brackets = { enabled = true } },
        ghost_text = { enabled = true }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' }
    },
    signature = {
        enabled = true,
        window = {
            show_documentation = false
        }
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
})
