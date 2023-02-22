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
    keymap('n', '<leader>d', '<cmd>Lspsaga goto definition<CR>')
    keymap('n', '<leader>rn', '<cmd>Lspsaga rename ++project<CR>')


    keymap("n", "<leader>n", function()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
end

local M = {
    setup = setup,
}

return M
