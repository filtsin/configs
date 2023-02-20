local setup = function()
    vim.api.nvim_command [[
        autocmd BufWritePre *.rs lua vim.lsp.buf.format()
    ]]
end

local M = {
    setup = setup,
}

return M
