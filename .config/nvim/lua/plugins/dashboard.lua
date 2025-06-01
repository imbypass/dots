return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = function()
            local logo = [[
  ▄▄▄▄·  ▄· ▄▌ ▄▄▄· ▄▄▄· .▄▄ · .▄▄ ·
  ▐█ ▀█▪▐█▪██▌▐█ ▄█▐█ ▀█ ▐█ ▀. ▐█ ▀.
  ▐█▀▀█▄▐█▌▐█▪ ██▀·▄█▀▀█ ▄▀▀▀█▄▄▀▀▀█▄
  ██▄▪▐█ ▐█▀·.▐█▪·•▐█ ▪▐▌▐█▄▪▐█▐█▄▪▐█
  ·▀▀▀▀   ▀ • .▀    ▀  ▀  ▀▀▀▀  ▀▀▀▀
      ]]

            local base16 = require("base16-colorscheme")
            local colors = base16.colors or {}

            local opts = {
                theme = "doom",
                hide = {
                    -- This is taken care of by lualine
                    -- Enabling this messes up the actual laststatus setting after loading a file
                    statusline = false,
                    tabline = false,
                    winbar = false,
                },
                config = {
                    header = vim.split(logo, "\n", { trimempty = true }),
                    center = {
                        { action = 'lua LazyVim.pick()()',                           desc = " Find File",    icon = " ", key = "f" },
                        { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files", icon = " ", key = "r" },
                        { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",       icon = " ", key = "c" },
                        { action = "Lazy",                                           desc = " Lazy",         icon = " ", key = "l" },
                        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",         icon = " ", key = "q" },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
                    end,
                },
            }

            for _, button in ipairs(opts.config.center) do
                button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
                button.key_format = " %s"
            end

            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "DashboardLoaded",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            return opts
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
        config = function(_, opts)
            -- Apply base16 colors to dashboard highlights
            local base16 = require("base16-colorscheme")
            local colors = base16.colors or {}

            vim.api.nvim_set_hl(0, "DashboardHeader", { fg = colors.base0D })
            vim.api.nvim_set_hl(0, "DashboardCenter", { fg = colors.base0B })
            vim.api.nvim_set_hl(0, "DashboardShortcut", { fg = colors.base0B })
            vim.api.nvim_set_hl(0, "DashboardFooter", { fg = colors.base03 })

            require("dashboard").setup(opts)
        end,
    },
    -- Disable other dashboard plugins to avoid conflicts
    {
        "folke/snacks.nvim",
        optional = true,
        opts = {
            dashboard = {
                enabled = false,
            },
            picker = {
                enabled = true,
                theme = "base16", -- Use base16 theme instead of tokyonight
            },
            -- Apply base16 theme to all other snacks components
            styles = {
                base16 = true, -- Use base16 colors for all UI components
            },
        },
    },
    {
        "goolord/alpha-nvim",
        optional = true,
        enabled = false,
    },
}
