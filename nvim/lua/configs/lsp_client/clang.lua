local setup = function()
    require('lspconfig').clangd.setup {
        cmd = { 'clangd', '--background-index', '--clang-tidy' },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    }
    vim.keymap.set('n', '<space>t', ':ClangdSwitchSourceHeader<CR>')
end

local ft = {
    '*.cpp',
    '*.c',
    '*.h',
    '*.hpp'
}

local M = {
    ft = ft,
    setup = setup,
}

return M


