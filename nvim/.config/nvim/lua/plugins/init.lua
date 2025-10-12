return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- plugins:
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        enable = true,
        extra_groups = {
          "Normal",
          "NormalNC",
          "NormalFloat",
          "NvimTreeNormal",
          "NvimTreeNormalNC",
          "Pmenu",
          "TelescopeNormal",
          "TelescopeBorder",
          "VertSplit",
          "FloatBorder",
          "StatusLine",
        },
        exclude = {},
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    -- latex
    "lervag/vimtex",
    lazy = true,
    init = function()
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_view_method = "zathura"
    end
  },
  --{
  -- typst
  --  "chomosuke/typst-preview.nvim",
  --  lazy = true,
  --  version = '1.*',
  --  opts = { -- opts{} is setup {}
  --    debug = false,
  --    follow_cursor = true,
  --    invert_colors = 'never',
  --    --
  --    open_cmd = nil,
  --    extra_args = nil,
  --  }, 
  --}
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
