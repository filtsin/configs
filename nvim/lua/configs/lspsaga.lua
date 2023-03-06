local setup = function()
    local keymap = vim.keymap.set

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

    keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')
    keymap('n', '<space>a', '<cmd>Lspsaga code_action<CR>')
    keymap('n', '<leader>d', '<cmd>Lspsaga goto definition<CR>')
    keymap('n', '<leader>rn', '<cmd>Lspsaga rename ++project<CR>')
    keymap('n', '<leader>o', '<cmd>Lspsaga outline<CR>')


    keymap("n", "<leader>n", function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)
end

local M = {
    setup = setup,
}

return M
