local M = {}

M.lualine = require('configs.lualine').setup
M.nightfox = require('configs.nightfox').setup
M.treesitter = require('configs.treesitter').setup
M.mason = require('configs.mason').setup
M.mason_lazy = require('configs.mason').lazy_load
M.cmp = require('configs.cmp').setup
M.telescope_keys = require('configs.telescope').keys
M.ranger = require('configs.ranger').setup
M.luatab = require('configs.luatab').setup
M.noice = require('configs.noice').setup
M.rust_tools = require('configs.rust_tools').setup
M.lspsaga = require('configs.lspsaga').setup
M.luasnip = require('configs.luasnip').setup

return M
