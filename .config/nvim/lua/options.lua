require "nvchad.options"

local o = vim.o

o.cursorlineopt = 'both' -- to enable cursorline!
o.termguicolors = true
require('base16-colorscheme').setup({
    -- start colors
-- Stardew Night scheme by Sammyette
base00 = '#16161b',
base01 = '#212127',
base02 = '#16161b',
base03 = '#373741',
base04 = '#4f4f5e',
base05 = '#9595ae',
base06 = '#e9ecf3',
base07 = '#67677b',
base08 = '#ff5454',
base09 = '#ff985a',
base0A = '#f6c177',
base0B = '#6bc174',
base0C = '#9ccfd8',
base0D = '#70abff',
base0E = '#ff72ff',
base0F = '#c175ff',
    -- end colors
})

vim.opt.relativenumber = true

local enable_providers = {
    "python3_provider",
    "node_provider",
}

for _, plugin in pairs(enable_providers) do
    vim.g["loaded_" .. plugin] = nil
    vim.cmd("runtime " .. plugin)
end
