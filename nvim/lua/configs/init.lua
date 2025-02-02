local M = {}

M.lualine = require('configs.lualine').setup
M.nightfox = require('configs.nightfox').setup
M.treesitter = require('configs.treesitter').setup
M.mason = require('configs.mason').setup
M.mason_lazy = require('configs.mason').lazy_load
M.cmp = require('configs.cmp').setup
M.telescope_keys = require('configs.telescope').keys
M.luatab = require('configs.luatab').setup
M.noice = require('configs.noice').setup
M.lspsaga = require('configs.lspsaga').setup
M.luasnip = require('configs.luasnip').setup
M.crates = require('configs.crates').setup
M.oil = require('configs.oil').setup
M.flash = require('configs.flash').setup
M.tokyonight = require('configs.tokyonight').setup
M.jellybeans = require('configs.jellybeans').setup
M.llm = require('configs.llm').setup

return M
