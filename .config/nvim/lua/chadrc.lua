-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}
M.ui = {
	theme = 'default',
	transparency = true,
	cmp = {
    lspkind_text = true,
    icons_left = true,
    style = "flat_dark",
  },
  statusline = {
		theme = 'minimal',
		separator_style = 'block'
  },
}
M.nvdash = {
		load_on_startup = true,
    header = {
      [[ ▄▄▄▄·  ▄· ▄▌ ▄▄▄· ▄▄▄· .▄▄ · .▄▄ ·  ]],
      [[ ▐█ ▀█▪▐█▪██▌▐█ ▄█▐█ ▀█ ▐█ ▀. ▐█ ▀.  ]],
      [[ ▐█▀▀█▄▐█▌▐█▪ ██▀·▄█▀▀█ ▄▀▀▀█▄▄▀▀▀█▄ ]],
      [[ ██▄▪▐█ ▐█▀·.▐█▪·•▐█ ▪▐▌▐█▄▪▐█▐█▄▪▐█ ]],
      [[ ·▀▀▀▀   ▀ • .▀    ▀  ▀  ▀▀▀▀  ▀▀▀▀  ]],
      [[ ]],
      [[ ]]
    }
}

return M
