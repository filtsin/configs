local setup = function()
    vim.api.nvim_command [[
        autocmd BufWritePre *.rs lua vim.lsp.buf.format()
    ]]

    vim.keymap.set('n', '<leader>mm', require('rust-tools.expand_macro').expand_macro)
    vim.keymap.set('n', '<leader>mc', require('rust-tools.open_cargo_toml').open_cargo_toml)
    vim.keymap.set('n', '<leader>pr', require('rust-tools.parent_module').parent_module)

    -- other settings in lsp_client/rust.lua
end

local M = {
    setup = setup,
}

return M
