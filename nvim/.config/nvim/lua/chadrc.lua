-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",
	transparency = true, --needed for plugin
}

-- nvui.cheatsheet
M.cheatsheet = {
  theme =  "simple", --simple or grid
  excluded_group = { "autopairs" },
}


-- nvui.statusline: The Status Bar at the bottom
M.ui = {
  statusline = {
    theme = "vscode_colored",             -- default, vscode, vscode_colored, minimal
    separator_style = "arrow",     -- default, round, block, arrow
    order = { "mode", "f", "git", "%=", "lsp_msg", "%=", "lsp", "cwd", "xyz", "abc"},
    --
    --
  }
}


-- NVDASH: The SplashScreen
M.nvdash = { load_on_startup = true }
  M.ui = {
       tabufline = {
          lazyload = true
      }
}

return M
