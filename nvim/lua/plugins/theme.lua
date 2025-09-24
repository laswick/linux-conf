return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		name = "everforest",
		priority = 1000,

		config = function()
			require("everforest").setup({
				background = "hard",
				italics = false,
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = ...,
		lazy = false,
	},
}
