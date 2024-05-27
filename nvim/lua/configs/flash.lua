local setup = function()
    vim.keymap.set('n', 's', require('flash').jump)
    vim.keymap.set('n', 'S', require('flash').treesitter)
    vim.keymap.set('n', 'f', require('flash').remote)
    vim.keymap.set('c', '<c-s>', require('flash').toggle)
end

local M = {
    setup = setup
}

return M
