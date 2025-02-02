local setup = function()
    require('jellybeans').setup { }
    vim.cmd('colorscheme jellybeans')
end

local M = {
    setup = setup,
}

return M
