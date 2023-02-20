local setup = function()
    vim.keymap.set('n', '<leader>q', ':RangerCurrentFile<CR>')
    vim.keymap.set('n', '<leader>r', ':RangerWorkingDirectory<CR>')

    vim.cmd('command Exp :RangerCurrentFile')
end

local M = {
    setup = setup,
}

return M
