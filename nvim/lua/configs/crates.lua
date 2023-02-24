local setup = function()
    require('crates').setup{}

    vim.keymap.set('n', '<leader>z', require('crates').toggle, { buffer = true })
    vim.keymap.set('n', '<leader>u', require('crates').upgrade_crate, { buffer = true })
    vim.keymap.set('n', '<leader>U', require('crates').upgrade_all_crates, { buffer = true })
end

local M = {
    setup = setup,
}

return M
