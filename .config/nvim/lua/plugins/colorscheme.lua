-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
    {
        "RRethy/nvim-base16",
        priority = 2000, -- Increased priority to ensure it loads before other colorschemes
        config = function()
            -- Set base16 as the active colorscheme
            vim.cmd.colorscheme("base16-default-dark")

            -- Apply our custom base16 colors from config/base16.lua
            -- This is already loaded in init.lua, but we make sure it's applied here too
            require("config.base16")
        end,
    },
    -- Explicitly disable tokyonight to ensure it doesn't interfere with our colorscheme
    {
        "folke/tokyonight.nvim",
        enabled = true,
    },
}
