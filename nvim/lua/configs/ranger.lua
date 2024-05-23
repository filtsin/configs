local setup = function()
    -- vim.keymap.set('n', '<leader>q', ':RangerCurrentFile<CR>')
    -- vim.keymap.set('n', '<leader>r', ':RangerWorkingDirectory<CR>')
    --
    -- vim.cmd('command Exp :RangerCurrentFile')
    -- require('ranger-nvim').setup {
    --     replace_netrw = true
    -- }

    -- vim.api.nvim_create_user_command("Exp", function()
    --     require('yazi').open(vim.fn.expand('%:p:h'))
    -- end, {})
    --
    -- require('yazi').setup{
    --     oil = true
    -- }

end

local M = {
    setup = setup,
}

return M
