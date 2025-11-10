-- Disable status line until lualine loads
vim.opt.laststatus = 0

vim.pack.add({
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' }
})

require('nvim-web-devicons').setup()
local plugin = require('lualine')

ThemeColors = {
    bg = Colors.Zeus,
    black = Colors.Woodsmoke,
    grey = Colors.IronsideGray,
    brown = Colors.TobaccoBrown,
    green_bright = Colors.GladeGreen,
    red = Colors.SantaFe,
    green_select = Colors.Dingley,
    orange = Colors.Copper,
    golden = Colors.Roti,
    white = Colors.Putty,
}

        local conditions = {
            buffer_not_empty    = function()
                return vim.fn.empty(vim.fn.expand '%:t') ~= 1
            end,
            no_git              = function()
                local filepath = vim.fn.expand '%:p:h'
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir == ""
            end,
            buffer_empty        = function()
                return vim.fn.empty(vim.fn.expand '%:t') == 1
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand '%:p:h'
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- dump object contents
        local function dump(o)
            if type(o) == 'table' then
                local s = ''
                for k, v in pairs(o) do
                    if type(k) ~= 'number' then
                        k = '"' .. k .. '"'
                    end
                    s = s .. dump(v) .. ','
                end
                return s
            else
                return tostring(o)
            end
        end
        -- auto change color according to neovims mode
        local mode_color = {
            n = ThemeColors.orange,
            i = ThemeColors.green_bright,
            v = ThemeColors.green_select,
            [''] = ThemeColors.green_select,
            V = ThemeColors.green_select,
            c = ThemeColors.brown,
            no = ThemeColors.brown,
            s = ThemeColors.orange,
            S = ThemeColors.orange,
            [''] = ThemeColors.orange,
            ic = ThemeColors.red,
            R = ThemeColors.red,
            Rv = ThemeColors.red,
            cv = ThemeColors.red,
            ce = ThemeColors.red,
            r = ThemeColors.golden,
            rm = ThemeColors.golden,
            ['r?'] = ThemeColors.golden,
            ['!'] = ThemeColors.brown,
            t = ThemeColors.brown,
        }
        local mode_text_color = {
            n = ThemeColors.black,
            i = ThemeColors.black,
            v = ThemeColors.black,
            [''] = ThemeColors.black,
            V = ThemeColors.black,
            c = ThemeColors.white,
            no = ThemeColors.white,
            s = ThemeColors.black,
            S = ThemeColors.black,
            [''] = ThemeColors.black,
            ic = ThemeColors.black,
            R = ThemeColors.black,
            Rv = ThemeColors.black,
            cv = ThemeColors.black,
            ce = ThemeColors.black,
            r = ThemeColors.black,
            rm = ThemeColors.black,
            ['r?'] = ThemeColors.black,
            ['!'] = ThemeColors.white,
            t = ThemeColors.white,
        }


        -- config
        local config = {
            options = {
                -- remove default sections and component separators
                component_separators = '',
                section_separators = '',
                theme = {
                    -- setting defaults to statusline
                    normal = { c = { fg = ThemeColors.fg, bg = ThemeColors.bg } },
                    inactive = { c = { fg = ThemeColors.fg, bg = ThemeColors.bg } },
                },
            },
            sections = {
                -- clear defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- clear for later use
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                -- clear defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- clear for later use
                lualine_c = {},
                lualine_x = {},
            },
        }

        -- insert active component in lualine_c at left section
        local function active_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- insert inactive component in lualine_c at left section
        local function inactive_left(component)
            table.insert(config.inactive_sections.lualine_c, component)
        end

        -- insert active component in lualine_x at right section
        local function active_right(component)
            table.insert(config.sections.lualine_x, component)
        end
        -- insert inactive component in lualine_x at right section
        local function inactive_right(component)
            table.insert(config.inactive_sections.lualine_x, component)
        end

        -- active right section
        active_right {
            function()
                local tab_count = vim.fn.tabpagenr('$')
                return (tab_count == 1) and "" or ('tabs: ' .. tab_count)
            end,
            icon = '󰓪',
            color = { bg = ThemeColors.green_select, fg = ThemeColors.black },
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░', left = '░▒▓' },
        }

        active_right {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            colored = false,
            color = { bg = ThemeColors.red, fg = ThemeColors.black },
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░', left = '░▒▓' },
        }
        active_right {
            'searchcount',
            icon = '',
            color = { bg = ThemeColors.golden, fg = ThemeColors.black },

            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░', left = '░▒▓' },
        }

        active_right {
            function()
                local clients = vim.lsp.get_clients()
                local count_map = {}
                -- Count occurrences of each client name
                for _, client in ipairs(clients) do
                    local name = client.name
                    count_map[name] = (count_map[name] or 0) + 1
                end

                local formatted = {}
                for name, count in pairs(count_map) do
                    if name == 'lua_ls' then name = 'lua' end
                    if name == 'typos_lsp' then name = 'typo' end
                    if name == 'rust-analyzer' then name = 'rust' end
                    table.insert(formatted, name .. (count > 1 and " x" .. count or ""))
                end

                return table.concat(formatted, ", ")
            end,
            icon = '󰒓',
            color = { bg = ThemeColors.green_bright, fg = ThemeColors.black },
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░', left = '░▒▓' },
        }
        active_right {
            function()
                local res = 'llm on:'
                local some = require('codeium.virtual_text').status_string()
                if some == ' 0 ' then
                    res = res .. ' 0'
                else
                    res = res .. some
                end
                if not WindIsOn then
                    res = 'llm off'
                end
                return res
            end,
            icon = '',
            color = { bg = ThemeColors.green_select, fg = ThemeColors.black },
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░', left = '░▒▓' },
        }

        active_right {
            function()
                local res
                if AutoEnable then
                    res = 'off'
                else
                    res = 'on'
                end
                return 'cmp ' .. res
            end,
            icon = '',
            color = { bg = ThemeColors.green_bright, fg = ThemeColors.black },
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░', left = '░▒▓' },
        }
        active_right {
            'location',
            icon = '',
            color = { bg = ThemeColors.green_select, fg = ThemeColors.black },
            padding = { left = 1, right = 0 },
            separator = { left = '░▒▓' },
        }
        active_right {
            function()
                local cur = vim.fn.line '.'
                local total = vim.fn.line '$'
                return string.format('%2d%%%%', math.floor(cur / total * 100))
            end,
            color = { bg = ThemeColors.green_select, fg = ThemeColors.black },
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░' },
        }
        active_right {
            'o:encoding',
            fmt = string.upper,
            icon = '',
            padding = { left = 1, right = 1 },
            color = { bg = ThemeColors.orange, fg = ThemeColors.black },
        }
        active_right {
            'fileformat',
            fmt = string.lower,
            icons_enabled = true,
            color = { bg = ThemeColors.orange, fg = ThemeColors.black },
            separator = { right = '' },
            padding = { left = 0, right = 1 },
        }

        -- active left section
        active_left {
            function()
                local icon
                local ok, devicons = pcall(require, 'nvim-web-devicons')
                if ok then
                    icon = devicons.get_icon(vim.fn.expand '%:t')
                    if icon == nil then
                        icon = devicons.get_icon_by_filetype(vim.bo.filetype)
                    end
                else
                    if vim.fn.exists '*WebDevIconsGetFileTypeSymbol' > 0 then
                        icon = vim.fn.WebDevIconsGetFileTypeSymbol()
                    end
                end
                if icon == nil then
                    icon = ''
                end
                return icon:gsub('%s+', '')
            end,
            color = function()
                return { bg = mode_color[vim.fn.mode()], fg = mode_text_color[vim.fn.mode()] }
            end,
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░' },
        }
        active_left {
            'filename',
            cond = conditions.buffer_not_empty,
            color = function()
                return { bg = mode_color[vim.fn.mode()], fg = mode_text_color[vim.fn.mode()] }
            end,
            padding = { left = 0, right = 1 },
            separator = { right = '▓▒░' },
            symbols = {
                modified = '󰶻 ',
                readonly = ' ',
                unnamed = ' ',
                newfile = ' ',
            },
        }
        active_left {
            function()
                return 'welcome.nvim'
            end,
            cond = conditions.buffer_empty,
            color = function()
                return { bg = mode_color[vim.fn.mode()], fg = mode_text_color[vim.fn.mode()] }
            end,
            padding = { left = 0, right = 1 },
            separator = { right = '▓▒░' },
        }
        active_left {
            'branch',
            color = { bg = ThemeColors.green_select, fg = ThemeColors.black },
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░', left = '░▒▓' },
        }

        active_left {
            function()
                return "none"
            end,
            cond = conditions.no_git,
            icon = "",
            color = { bg = ThemeColors.green_select, fg = ThemeColors.black },
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░', left = '░▒▓' },
        }

        -- inactive left section
        inactive_left {
            function()
                return ''
            end,
            cond = conditions.buffer_not_empty,
            color = { bg = ThemeColors.black, fg = ThemeColors.grey },
            padding = { left = 1, right = 1 },
        }
        inactive_left {
            'filename',
            cond = conditions.buffer_not_empty,
            color = { bg = ThemeColors.black, fg = ThemeColors.grey },
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░' },
            symbols = {
                modified = '',
                readonly = '',
                unnamed = '',
                newfile = '',
            },
        }

        -- inactive right section
        inactive_right {
            'location',
            color = { bg = ThemeColors.black, fg = ThemeColors.grey },
            padding = { left = 1, right = 0 },
            separator = { left = '░▒▓' },
        }
        inactive_right {
            'progress',
            color = { bg = ThemeColors.black, fg = ThemeColors.grey },
            padding = { left = 1, right = 1 },
            separator = { right = '▓▒░' },
        }
        inactive_right {
            'fileformat',
            fmt = string.lower,
            icons_enabled = false,
            color = { bg = ThemeColors.black, fg = ThemeColors.grey },
            separator = { right = '▓▒░' },
            padding = { left = 0, right = 1 },
        }

plugin.setup(config)

-- Restore statusline visibility
vim.opt.laststatus = 3
