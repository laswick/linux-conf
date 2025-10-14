vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.number = false

vim.g.background = "dark"

--vim.cmd.colorscheme "catppuccin"
--vim.cmd.colorscheme "gruvbox"
vim.cmd.colorscheme "everforest"
--vim.cmd.colorscheme "miasma"

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
