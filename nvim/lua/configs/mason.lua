local lsp_client = require('configs.lsp_client')

local mason_servers = {
    'lua_ls',
    'rust_analyzer',
    'clangd',
    'pyright',
}

local setup = function()
    require('lsp_signature').setup {
        max_width = 100,
    }

    require('mason').setup {}

    local mason = require('mason-lspconfig')

    mason.setup {
        ensure_installed = mason_servers
    }

    for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
        local default_diagnostic_handler = vim.lsp.handlers[method]
        vim.lsp.handlers[method] = function(err, result, context, config)
            if err ~= nil and err.code == -32802 then
                return
            end
            return default_diagnostic_handler(err, result, context, config)
        end
    end

    mason.setup_handlers {
        function(server_name)
            require('lspconfig')[server_name].setup {}
        end,

        ['lua_ls'] = lsp_client.lua.setup,
        ['rust_analyzer'] = lsp_client.rust.setup,
        ['clangd'] = lsp_client.clang.setup,
        ['pyright'] = lsp_client.python.setup,

    }

    lsp_client.proto.setup{}

    vim.keymap.set({ 'n' }, '<C-k>', function()
        require('lsp_signature').toggle_float_win()
    end, { silent = true, noremap = true, desc = 'toggle signature' })

    vim.keymap.set({ 'n' }, '<Leader>k', function()
        vim.lsp.buf.signature_help()
    end, { silent = true, noremap = true, desc = 'toggle signature' })

    vim.keymap.set('n', '<leader>z', vim.lsp.buf.format)
end

local lazy_load = function()
    local all_ft = {
        lsp_client.lua.ft,
        lsp_client.rust.ft,
        lsp_client.clang.ft,
        lsp_client.python.ft,
        lsp_client.proto.ft
    }

    local result = {}

    for i = 1, #all_ft do
        for j = 1, #all_ft[i] do
            result[#result + 1] = 'BufReadPre ' .. all_ft[i][j]
        end
    end

    return result
end

local M = {
    setup = setup,
    lazy_load = lazy_load
}

return M
