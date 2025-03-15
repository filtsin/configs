local setup = function()
    require('notify').setup({
        -- other stuff
        background_colour = "#000000"
    })

    require('nightfox').setup {
        palettes = {
            all = {
                bg1 = "#1D1F21"
            }
        },
    }

    vim.cmd('colorscheme nightfox')
end

local M = {
    setup = setup,
}

return M
