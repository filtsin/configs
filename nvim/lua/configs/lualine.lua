local setup = function()
    require('lualine').setup {
        options = { theme = 'codedark', },
        sections = {
            lualine_b = { 'branch', 'diff',
                { 'diagnostics', sources = { 'nvim_diagnostic' }, sections = { 'error', 'warn', 'info' } }
            },
            lualine_c = { { 'filename', path = 1 }, 'lsp_progress' }
        },
    }
end

local M = {
    setup = setup,
}

return M
