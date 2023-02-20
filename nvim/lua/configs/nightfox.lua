local setup = function()
    require('nightfox').setup {
        palettes = {
            nightfox = {
                bg1 = "#1D1F21"
            }
        }
    }

    vim.cmd('colorscheme nightfox')
end

local M = {
    setup = setup,
}

return M
