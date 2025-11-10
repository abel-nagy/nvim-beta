local plugin = require('floating-help')

plugin.setup({
    width = 0.5
})

vim.keymap.set('n', '<F1>', plugin.toggle)

local function cmd_abbrev(abbrev, expansion)
    local cmd = 'cabbr ' .. abbrev .. ' <c-r>=(getcmdpos() == 1 && getcmdtype() == ":" ? "' .. expansion .. '" : "' .. abbrev .. '")<CR>'
    vim.cmd(cmd)
end

-- Redirect ':h' to ':FloatingHelp'
cmd_abbrev('h',         'FloatingHelp')
cmd_abbrev('help',      'FloatingHelp')
cmd_abbrev('helpc',     'FloatingHelpClose')
cmd_abbrev('helpclose', 'FloatingHelpClose')
