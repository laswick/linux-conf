
-- Generic
vim.keymap.set('n', '<S-L>', ':vsplit<CR>', {})

--TODO: Add the mappings from lsp.lua
-- nvim-lspconfig
--vim.keymap.set('n', 'K', 'vim.lsp.buf.hover()', { desc = "LSP Hover" })
--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
--vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "LSP Go to References" })
--vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "LSP Go to Implementation" })
--vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "LSP Rename" })
--vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
--vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { desc = "LSP Format" })

-- telescope
-- These have to be done in telescope.lua.
--vim.keymap.set('n', '<C-p>', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- neo-tree
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left toggle<CR>', {})
vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})

-- git
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})

