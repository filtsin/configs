local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd


vim.g.mapleader = '\\'

-- no arrows
map('', '<up>', '', { noremap = true, silent = false })
map('', '<down>', '', { noremap = true, silent = false })
map('', '<left>', '', { noremap = true, silent = false })
map('', '<right>', '', { noremap = true, silent = false })

-- common
map('i', 'jj', '<Esc>', { noremap = true })
map('n', '<leader>w', ':w<CR>', default_opts)
map('n', '<leader>e', ':RangerNewTab<CR>', default_opts)
map('n', '<leader>c', ':tabclose<CR>', default_opts)
map('n', '<leader>1', '1gt', default_opts)
map('n', '<leader>2', '2gt', default_opts)
map('n', '<leader>3', '3gt', default_opts)
map('n', '<leader>4', '4gt', default_opts)

-- ranger keymap
map('n', '<leader>q', ':RangerCurrentFile<CR>', default_opts)
map('n', '<leader>r', ':RangerWorkingDirectory<CR>', default_opts)
cmd 'command Exp :RangerCurrentFile'

-- lsp
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)
map('n', '<space>a', ':CodeActionMenu<CR>', default_opts)
map('n', '<leader>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', default_opts)
map('n', '<leader>p', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', default_opts)
map('n', '<leader>ff', '<cmd>lua vim.lsp.buf.format()<CR>', default_opts)

-- telescope
map('n', '<leader>f', '<cmd>lua require("telescope.builtin").find_files()<CR>', default_opts)
map('n', '<leader>s', '<cmd>lua require("telescope.builtin").live_grep()<CR>', default_opts)
map('n', '<leader>1', '<cmd>lua require("telescope.builtin").grep_string()<CR>', default_opts)
map('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<CR>', default_opts)
map('n', '<leader>d', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', default_opts)
map('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', default_opts)
map('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', default_opts)
