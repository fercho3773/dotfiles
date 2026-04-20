return {
  {
    src = "https://github.com/L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",

    config = function()
      local ls = require("luasnip")

      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })

      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, { silent = true })
      vim.keymap.set({"i","s"}, "<C-L>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({"i","s"}, "<C-J>", function() ls.jump(-1) end, { silent = true })
    end
  }
}
