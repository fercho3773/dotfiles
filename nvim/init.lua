-- neovim config

-- temp
vim.opt.fileencodings = { "utf-8", "latin1" }

-- Basic
require("func")  -- functions
require("keys")  -- keybinds
require("opts")  -- options
require("stln")  -- statusline
require("tabs")  -- tabs
require("term")  -- terminal
require("snip")  -- snippet function

-- Plugins
require("plug")  -- plugin list
