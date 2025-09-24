
return {
    "nvim-treesitter/nvim-treesitter", 
    branch = 'master',
    lazy = false, 
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "c", "cpp", "python", "bash", "markdown", "vim", "vimdoc", "yaml", "toml", "bash", "cmake" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
