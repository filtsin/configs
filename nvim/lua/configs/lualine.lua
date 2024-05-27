local setup = function()
    require('lualine').setup {
        options = { theme = 'codedark', },
        sections = {
            lualine_b = { 'branch', 'diff',
                { 'diagnostics', sources = { 'nvim_diagnostic' }, sections = { 'error', 'warn', 'info' } }
            },
            lualine_c = { { 'filename', path = 1 }, 'lsp_progress' },
            lualine_x = {
                {
                    require('noice.api.status').mode.get,
                    cond = require('noice.api.status').mode.has,
                    color = { fg = '#ff9e64' },
                },
                {
                    require("noice").api.status.command.get,
                    cond = require("noice").api.status.command.has,
                    color = { fg = "#ff9e64" },
                },
                {
                    require("noice").api.status.search.get,
                    cond = require("noice").api.status.search.has,
                    color = { fg = "#ff9e64" },
                },
            }
        },
    }
end

local M = {
    setup = setup,
}

return M
