local setup = function()
    local keymap = vim.keymap.set

    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'None' })

    require('lspsaga').setup {
        outline = {
            win_position = "left",
            win_width = 40,
        },
        diagnostic = {
            on_insert = false
        },
        lightbulb = {
            enable = false
        },
    }

    -- keymap('n', 'gh', '<cmd>Lspsaga finder<CR>')
    keymap('n', '<space>a', '<cmd>Lspsaga code_action<CR>')
    keymap('n', '<leader>d', '<cmd>Lspsaga goto definition<CR>')
    keymap('n', '<leader>p', '<cmd>Lspsaga peek_definition<CR>')
    keymap('n', '<leader>rn', '<cmd>Lspsaga rename ++project<CR>')
    keymap('n', '<leader>x', '<cmd>Lspsaga hover_doc<CR>')
    keymap('n', '<leader>o', '<cmd>Lspsaga outline<CR>')


    keymap("n", "<leader>n", function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)
end

local M = {
    setup = setup,
}

return M
