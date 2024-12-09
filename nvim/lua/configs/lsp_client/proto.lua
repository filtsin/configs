local setup = function()
    require('lspconfig').protols.setup { }
end

local ft = {
    '*.proto'
}

local M = {
    ft = ft,
    setup = setup,
}

return M
