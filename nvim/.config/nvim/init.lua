-- Thanks to Radley E. Sidwell-lewis, the original author for the suckless neovim config

--require("plug")  -- plugins
require("func")  -- functions
require("keys")  -- keybinds
require("opts")  -- options
require("stln")  -- statusline
require("tabs")  -- tabs
require("term")  -- terminal
require("snip")  -- snippet function

vim.snippet.add("fig", "TEST", { buffer = true })


--vim.pack.add(require("plugins.luasnip"))
