return {
    {
        "github/copilot.vim"
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            branch = "master",
        },
        build = "make tiktoken",
        opts = {
            model = 'gpt-4.1', -- AI model to use
            temperature = 0.1, -- Lower = focused, higher = creative
            auto_insert_mode = true,
            welcome_message = 'Hello! How can I assist you today?',

            headers = {
                user = '👤 You',
                assistant = '🤖 Copilot',
                tool = '🔧 Tool',
            },

            separator = '━━',
            auto_fold = true, -- Automatically folds non-assistant messages
        },
    },
}
