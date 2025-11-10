![Welcome Screen](./assets/welcome.png)

# NeoVim 0.12 Config
**Current version:** v0.12.0-dev-1567   
**Build number:** g17bcf86cab

# Stack
**Plugin manager:** vim.pack *(NeoVim's built-in plugin manager)*

## LSP setup
1. [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
2. [Mason](https://github.com/mason-org/mason.nvim)
3. [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim)
4. [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)

## Code Completion
5. [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
6. [friendly-snippets](https://github.com/L3MON4D3/LuaSnip)
7. [blink.cmp](https://github.com/Saghen/blink.cmp)

## UI/Visuals
8. [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) *(Using 'main' branch as it's the updated one)*
9. [alpha.nvim](https://github.com/goolord/alpha-nvim)
10. [nvim-notify](https://github.com/rcarriga/nvim-notify)
11. [comfy-line-numbers.nvim](https://github.com/mluders/comfy-line-numbers.nvim)
12. [floating-help.nvim](https://github.com/Tyler-Barham/floating-help.nvim)
13. [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)
14. [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
15. [noice.nvim](https://github.com/folke/noice.nvim)
16. [oil.nvim](https://github.com/stevearc/oil.nvim)
17. [plugin-view.nvim](https://github.com/adriankarlen/plugin-view.nvim)
18. [render-markdown](https://github.com/adriankarlen/plugin-view.nvim)
19. [todo-comments](https://github.com/folke/todo-comments.nvim)
20. [undotree](https://github.com/mbbill/undotree)
21. [which-key](https://github.com/folke/which-key.nvim)

## Quality of Life
22. [colortils](https://github.com/max397574/colortils.nvim)
23. [commentary.nvim](https://github.com/shoukoo/commentary.nvim)
24. [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
25. [nvim-numbertoggle](https://github.com/sitiom/nvim-numbertoggle)

## Miscelaneus
26. [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
27. [pendulum-nvim](https://github.com/ptdewey/pendulum-nvim)
28. [pomo.nvim](https://github.com/epwalsh/pomo.nvim)

# Important features
- [x] Language Servers
- [x] Code completion
- [ ] Formatting
- [ ] Project building/running
- [ ] Debugging

# Development environments
- [x] Lua
- [ ] Zig
- [ ] Kotlin

# TODO
## Fixes
- [x] Check render-markdown.nvim dependency: [tree-sitter-markdown](https://github.com/tree-sitter-grammars/tree-sitter-markdown)
- [x] Create/find a solution for dependency handling
    Isn't really fixed, current setup is fully manual but less tedious than previous solution (one file per plugin)
- [ ] Fix welcome screen logo coloring issue
- [ ] Fix welcome screen dynamic text issue

## Add features
- [x] Setup TODO/HACK highlighting
- [ ] Add sensible git/github related plugins
    - [ ] LazyGit?
- [ ] Setup fuzzy finding inside files
- [ ] Setup keymap search
- [ ] 80 -> 120 line length + show that limit when nearing it in current line (only then)
- [ ] Update which-key config to describe unfinished keycombinations (like '<Leader>f' is the starting combination for telescope find commands)
- [ ] Finalize theming/coloring
- [ ] Enable italics
- [ ] Add image rendering support
