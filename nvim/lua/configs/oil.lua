local setup = function()
    require('oil').setup {
        columns = {
            "icon",
            "size",
        }
    }

    vim.api.nvim_create_user_command("Exp", function()
        require('oil').open()
    end, {})

    -- vim.api.nvim_create_autocmd('User', {
    --     pattern = 'OilEnter',
    --     callback = vim.schedule_wrap(function(args)
    --         local oil = require('oil')
    --         if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
    --             oil.select{preview = true}
    --         end
    --     end)
    -- })

end

local M = {
    setup = setup,
}

return M
