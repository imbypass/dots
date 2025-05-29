return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        local base16 = require("base16-colorscheme")
        local colors = base16.colors or {}

        local custom_theme = {
            normal = {
                a = { fg = colors.base00, bg = colors.base0D, gui = "bold" },
                b = { fg = colors.base05, bg = colors.base02 },
                c = { fg = colors.base05, bg = colors.base01 },
            },
            insert = {
                a = { fg = colors.base00, bg = colors.base0B, gui = "bold" },
            },
            visual = {
                a = { fg = colors.base00, bg = colors.base0E, gui = "bold" },
            },
            replace = {
                a = { fg = colors.base00, bg = colors.base08, gui = "bold" },
            },
            inactive = {
                a = { fg = colors.base04, bg = colors.base01 },
                b = { fg = colors.base03, bg = colors.base01 },
                c = { fg = colors.base03, bg = colors.base01 },
            },
        }

        opts.options.theme = custom_theme
    end,
}
