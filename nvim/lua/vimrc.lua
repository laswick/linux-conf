vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")

vim.g.background = "dark"

--vim.cmd.colorscheme "catppuccin"
--vim.cmd.colorscheme "gruvbox"
vim.cmd.colorscheme "everforest"

-- Remove trailing whitespace on save, except for markdown files.
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

