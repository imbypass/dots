return {
    {
        "stevearc/conform.nvim",
        event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = false
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc", "html", "css" }
        }
    },
    {
        "andweeb/presence.nvim",
        lazy = false
    },
    {
        "RRethy/base16-nvim",
        lazy = false
    }
}
