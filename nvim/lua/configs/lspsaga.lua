local setup = function()
    local keymap = vim.keymap.set

    require('lspsaga').setup {
        outline = {
            auto_preview = false
        },
        diagnostic = {
            on_insert = false
        },
        lightbulb = {
            enable = false
        }
    }

    keymap('n', '<space>a', '<cmd>Lspsaga code_action<CR>')
    keymap('n', '<leader>n', '<cmd>Lspsaga goto definition<CR>')
    keymap('n', '<leader>rn', '<cmd>Lspsaga rename ++project<CR>')
end

local M = {
    setup = setup,
}

return M
