local setup = function()
    require('jellybeans').setup {
        plugins = {
        }
    }
    vim.cmd('colorscheme jellybeans')
end

local M = {
    setup = setup,
}

return M
