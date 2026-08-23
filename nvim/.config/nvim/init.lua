vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.number = true

vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus" -- use the system clipboard!

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 250

vim.opt.termguicolors = true
vim.opt.undofile = true


-- Plugins
vim.pack.add({
    "https://github.com/sainnhe/gruvbox-material",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/echasnovski/mini.nvim",
    "https://github.com/nvim-lua/plenary.nvim", --needed for telescope
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/zbirenbaum/copilot.lua",
    "https://github.com/CopilotC-Nvim/CopilotChat.nvim",
})

-- Colour Scheme
vim.g.background = "dark"
--vim.cmd.colorscheme "gruvbox"
--vim.cmd.colorscheme "everforest"
--vim.cmd.colorscheme "miasma"
--vim.g.gruvbox_material_background = "soft"
--vim.g.gruvbox_material_background = "medium"
--vim.g.gruvbox_material_background = "hard"
--vim.g.gruvbox_material_foreground = "material"
vim.cmd.colorscheme "gruvbox-material"

-- Super simple status line: filename    eol-type     percentage
vim.o.statusline = "%t%=%{&ff}%=%p%%" --properly justified

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

-- Set the terminal title to the current file name.
vim.o.title = true
vim.o.titlestring = "%t"
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.o.titlestring = vim.fn.expand("%:t")
    end
})

-- Add highlighting for TODO, FIXME, NOTE, and BUG comments.
vim.api.nvim_set_hl(0, "TodoHighlight", { fg = "#FF0000", bg = "#FFFF00", bold = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.py" },
    callback = function()
        vim.fn.matchadd("TodoHighlight", "\\<\\(TODO\\|FIXME\\|NOTE\\|BUG\\):")
    end
})

-- LSP
-- note: this requires clangd: $ sudo apt install clangd
vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
    },

    root_markers = {
        "compile_commands.json",
        "compile_flags.txt",
        ".git",
    },

    filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
    },
})

vim.lsp.enable("clangd")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local opts = { buffer = ev.buf }

        -- Navigation / actions
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format()
        end, opts)

        -- Completion
        if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(
                true,
                client.id,
                ev.buf,
                {
                    autotrigger = true,
                }
            )
        end
    end,
})

vim.opt.completeopt = {
    "menu",
    "menuone",
    "noselect",
    "popup",
}

vim.keymap.set("i", "<C-Space>", function()
    vim.lsp.completion.get()
end)

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    severity_sort = true,

    float = {
        border = "rounded",
        source = "if_many",
    },
})

-- File Explorer
require("mini.files").setup({
    mappings = {
        go_in = "<Right>",
        go_in_plus = "<CR>",
        go_out = "<Left>",
    },
})

vim.keymap.set("n", "<leader>e", function()
    require("mini.files").open()
end)

-- Fuzzy Finder
-- note: fg (live grep) requires ripgrep: $ sudo apt install repgrep
require("telescope").setup()
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)

-- Copilot Suggestions
require("copilot").setup({
    suggestion = {
        enabled = true,
        auto_trigger = true,

        keymap = {
            accept = "<Tab>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
    },

    panel = {
        enabled = true,
    },
})

-- Copilot Chat
require("CopilotChat").setup({
    auto_insert_mode = true,
    window = {
        layout = "vertical",
        width = 0.5,
    },
})

vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<cr>", {
    desc = "Copilot Chat",
})

