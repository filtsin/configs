local setup = function()
    require('luasnip.loaders.from_lua').load {
        paths = './snippets'
    }
end

local M = {
    setup = setup,
}

return M
