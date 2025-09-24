vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")

vim.g.background = "dark"
--vim.cmd.colorscheme "catppuccin"
vim.cmd.colorscheme "gruvbox"
--vim.cmd.colorscheme "everforest"


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "markdown" then
      local save = vim.fn.winsaveview()
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.winrestview(save)
    end
  end,
})
--vim.g.mapleader = " "

-- NOTE! All these commands, especially the map leader, need to be set before
--       initializing lazy (see ~/.config/nvim/init.lua).
--
--       The colorscheme uses a lua plugin that's only initialized AFTER lazy,
--       so ... it's set in ~/.config/nvim/init.lua and NOT here.
