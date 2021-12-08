local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

-- Rust autoformat
vim.api.nvim_command [[
    autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync()
]]

-- Statusline: lualine
require('lualine').setup{
    options = { theme = 'nightfly', },
    sections = {
        lualine_b = {'branch', 'diff',
                      { 'diagnostics', sources={'nvim_lsp'}, sections = {'error', 'warn', 'info'}}
                     },
        lualine_c = { {'filename', path=1}, 'lsp_progress' }
    }
}

-- treesitter
require('nvim-treesitter.configs').setup{
    ensure_installed = {'cpp', 'rust', 'toml', 'lua', 'latex'},
    highlight = {
        enable = true,
    }
}

-- Comment
require('Comment').setup()

-- code action
vim.ui.select = require('popui.ui-overrider')

-- Luatab
require('luatab').setup{
    windowCount = function(index)
        return index .. ' '
    end,
    title = function(bufnr)
        local file = vim.fn.bufname(bufnr)
        local buftype = vim.fn.getbufvar(bufnr, '&buftype')
        local filetype = vim.fn.getbufvar(bufnr, '&filetype')

        if buftype == 'help' then
            return 'help:' .. vim.fn.fnamemodify(file, ':t:r')
        elseif buftype == 'quickfix' then
            return 'quickfix'
        elseif filetype == 'TelescopePrompt' then
            return 'Telescope'
        elseif buftype == 'terminal' then
            local _, mtch = string.match(file, "term:(.*):(%a+)")
            return mtch ~= nil and mtch or vim.fn.fnamemodify(vim.env.SHELL, ':t')
        elseif file == '' then
            return '[Empty]'
        else
            return vim.fn.fnamemodify(file, ':p:h:t') .. '/' .. vim.fn.fnamemodify(file, ':t')
        end
    end
}

-- Latex: vimtex
g.tex_flavor = 'latex'
g.vimtex_quickfix_mode = 0
g.vimtex_view_method = 'zathura'

-- ranger
g.ranger_replace_netrw = true
g.ranger_map_keys = 0

-- Other params
cmd [[
    filetype indent plugin on
    syntax enable
]]

-- don't auto commenting new line
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

cmd [[highlight ColorColumn ctermbg=238]]

opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.timeoutlen = 300
opt.encoding = 'utf-8'
opt.showmode = false
opt.hidden = true
opt.wrap = false
opt.joinspaces = false
opt.signcolumn = 'yes'
opt.undofile = true
opt.undodir = '/home/filtsin/.vimdid'
opt.foldenable = false
opt.ttyfast = true
opt.lazyredraw = true
opt.synmaxcol = 500
opt.laststatus = 2
opt.relativenumber = true
opt.number = true
opt.colorcolumn = '100'
opt.showcmd = true
opt.autoread = true
opt.clipboard = 'unnamedplus'
opt.so = 999
opt.termguicolors = true
opt.swapfile = false

-- Theme: material
g.material_theme_style = 'ocean'
cmd 'colorscheme material'
