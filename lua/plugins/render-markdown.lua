vim.pack.add({
    'https://github.com/nvim-mini/mini.icons',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})

require('render-markdown').setup({
    completions = { coq = { enabled = true } }
})
