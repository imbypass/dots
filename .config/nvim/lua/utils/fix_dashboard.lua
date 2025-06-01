-- Utility script to fix dashboard colors
-- Run this with :lua require('utils.fix_dashboard').reset()

local M = {}

function M.reset()
  local base16 = require("base16-colorscheme")
  local colors = base16.colors or {}
  
  -- Use a single color for all dashboard elements
  local dashboard_color = colors.base05
  
  -- Apply the same color to all dashboard highlight groups
  local highlights = {
    "DashboardHeader",
    "DashboardCenter",
    "DashboardShortcut",
    "DashboardFooter",
    "DashboardKey",
    "DashboardIcon",
    "DashboardDesc",
  }
  
  for _, hl_group in ipairs(highlights) do
    vim.api.nvim_set_hl(0, hl_group, { fg = dashboard_color })
  end
  
  -- Also fix dashboard-nvim specific highlight groups
  for _, hl_group in ipairs({
    "DashboardDesc",
    "DashboardKey",
    "DashboardIcon",
    "DashboardShortCut",
  }) do
    vim.api.nvim_set_hl(0, hl_group, { fg = dashboard_color })
  end
  
  -- Print a confirmation message
  print("Dashboard colors reset to a single color")
end

return M