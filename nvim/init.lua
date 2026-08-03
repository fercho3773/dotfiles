-- neovim config

-- builtin file tree
vim.g.netrw_list_style = 3
vim.g.netrw_winsize = 30

vim.opt.redrawtime = 1000                          -- ms to redraw screen
vim.opt.maxmempattern = 10000                      -- higher ram usage

vim.opt.number = true                              -- line numbers
vim.opt.relativenumber = true                      -- relative line numbers
vim.opt.cursorline = true                          -- highlight current line
vim.opt.wrap = true                                -- wrap lines
vim.opt.scrolloff = 10                             -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8                          -- keep 8 columns left/right of cursor

-- indentation
vim.opt.tabstop = 2                                -- tab width
vim.opt.shiftwidth = 2                             -- indent width
vim.opt.softtabstop = 2                            -- soft tab stop
vim.opt.expandtab = true                           -- use spaces instead of tabs
vim.opt.smartindent = true                         -- smart auto-indenting
vim.opt.autoindent = true                          -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true                          -- case insensitive search
vim.opt.smartcase = true                           -- case sensitive if uppercase in search
vim.opt.hlsearch = false                           -- highlight search results
vim.opt.incsearch = true                           -- show matches as you type

-- visual settings
vim.opt.termguicolors = true                       -- enable 24-bit colors
vim.opt.signcolumn = "yes"                         -- always show sign column
vim.opt.colorcolumn = "120"                        -- show column at _ characters
vim.opt.showmatch = true                           -- highlight matching brackets
vim.opt.matchtime = 2                              -- how long to show matching bracket
vim.opt.cmdheight = 1                              -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"  -- Completion options
vim.opt.showmode = false                           -- show mode in command line
vim.opt.pumheight = 10                             -- Popup menu height
vim.opt.pumblend = 10                              -- Popup menu transparency
vim.opt.winblend = 0                               -- Floating window transparency
vim.opt.conceallevel = 0                           -- do not hide markup
vim.opt.concealcursor = ""                         -- do not hide cursor line markup
vim.opt.lazyredraw = true                          -- do not redraw during macros
vim.opt.synmaxcol = 300                            -- syntax highlighting limit

-- file handling
vim.opt.backup = false                             -- create backup files
vim.opt.writebackup = false                        -- create backup before writing
vim.opt.swapfile = false                           -- create swap files
vim.opt.undofile = true                            -- persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")  -- undo directory
vim.opt.updatetime = 250                           -- faster completion
vim.opt.timeoutlen = 400                           -- key timeout duration
vim.opt.ttimeoutlen = 20                          -- key code timeout
vim.opt.autoread = false                           -- reload files changed outside vim
vim.opt.autowrite = false                          -- auto save

-- behavior settings
vim.opt.autochdir = false                          -- auto change directory
vim.opt.backspace = "indent,eol,start"             -- backspace behavior
vim.opt.errorbells = false                         -- no error bells
vim.opt.hidden = true                              -- hidden buffers
vim.opt.iskeyword:append("-")                      -- treat
vim.opt.path:append("**")                          -- include subdirectories in search
vim.opt.selection = "exclusive"                    -- selection behavior
vim.opt.mouse = "a"                                -- enable mouse support
vim.opt.clipboard:append("unnamedplus")            -- use system clipboard
vim.opt.modifiable = true                          -- allow buffer modifications
vim.opt.encoding = "utf-8"                         -- Set encoding
vim.opt.virtualedit = "onemore"                    -- prevents moving to left (insert to normal)

-- cursor settings
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- fold
vim.opt.foldmethod = "expr"                        -- use expression for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"    -- use treesitter for folding
vim.opt.foldlevel = 99                             -- start with all folds open

-- split behavior
vim.opt.splitbelow = true                          -- horizontal splits go below
vim.opt.splitright = true                          -- vertical splits go right

-- keybinds
local map=vim.keymap.set
local nvmap=vim.api.nvim_set_keymap

vim.g.mapleader = " "                              -- Set leader key to space
vim.g.maplocalleader = " "                         -- Set local leader key (NEW)

-- leader key should not move the cursor
map("n", "<Space>", "<Nop>", { silent = true })

-- run 'compilerdoc' script with leader + s
-- first map leader s to script, second you specify to not map it on insert mode
nvmap('n', '<leader>s', ':w!<CR>:!compilerdoc "%:p"<CR>', { silent = true, noremap = true })
nvmap('i', '<leader>s', '<Nop>', { noremap = true })

-- normal mode mappings
map("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })
nvmap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Save :W, with Leader + s
nvmap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })
nvmap('n', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })

-- Yank to the 'end of line'.
map("n", "Y", "y$", { desc = "Yank to end of line" })

-- Center screen when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- fast movement
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- yanking behaviour
map("x", "<leader>p", '"_dP', { desc = "paste w/o yanking" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "delete w/o yanking" })

-- buffer navigation
map("n", "<leader><Tab>",  ":bnext<CR>",     { desc = "next buffer" })
map("n", "<leader>bn",     ":bnext<CR>",     { desc = "next buffer" })
map("n", "<leader><Tab>p", ":bprevious<CR>", { desc = "prev buffer" })
map("n", "<leader>bp",     ":bprevious<CR>", { desc = "prev buffer" })
--map("n", "<leader>bc",     ":bdelete", { desc = "close buffer"})

-- window navigation
map("n", "<leader>wh", "<C-w>h",  { desc = "move to left window"   })
map("n", "<leader>wj", "<C-w>j",  { desc = "move to bottom window" })
map("n", "<leader>wk", "<C-w>k",  { desc = "move to top window"    })
map("n", "<leader>wl", "<C-w>l",  { desc = "move to right window"  })

-- split and resize
map("n", "<leader>sv", ":vsplit<CR>",            { desc = "split vertically" })
map("n", "<leader>sh", ":split<CR>",             { desc = "split horizontal" })
map("n", "<C-Up>",   ":resize +2<CR>",           { desc = "inc window height" })
map("n", "<C-Down>", ":resize -2<CR>",           { desc = "dec window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>",  { desc = "dec window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "inc window width" })

-- move lines up/down with shift jk
map("v", "<s-j>", ":m '>+1<CR>gv=gv", { desc = "move sel. down", noremap = true })
map("v", "<s-k>", ":m '<-2<CR>gv=gv", { desc = "move sel. up",   noremap = true })

-- indenting in visual mode
map("v", "<", "<gv", { desc = "indent left"})
map("v", ">", ">gv", { desc = "indent right" })

-- quick file navigation
map("n", "<leader>e", ":Explore<CR>", { desc = "open file explorer" })
--map("n", "<leader>ff", ":find ", { desc = "find file" })

-- better J behavior
map("n", "J", "mzJ`z", { desc = "join lines and keep cursor position" })

-- reload edit config
-- vim.keymap.set("n", "<leader>re", ":e $MYVIMRC<CR>", { desc = "Edit config" })
-- vim.keymap.set("n", "<leader>rr", ":so $MYVIMRC<CR>", { desc = "Reload config" })
map("n", "<leader>rl",

  function() 
    vim.cmd("source $MYVIMRC") 
    vim.notify("config reloaded")
  end,
{ desc = "Reload config" })

-- filetype tweaks
vim.g.tex_flavor = "latex"

-- plugins
vim.pack.add({
--
{
    src = 'https://github.com/L3MON4D3/LuaSnip', -- Url
    version = 'v2.5.0',  -- Git branch, tag or commit hash
},
{
    src = 'https://www.github.com/ibhagwan/fzf-lua',
    version = '532d463f5c83595192fe740572d8fd6902b2217a',
},
--{
--    src = 'https://github.com/saghen/blink.cmp',
--    version = 'v1.10.2',
--},
--{
--    src = 'https://github.com/hrsh7th/nvim-cmp',
--    version = '2ffe79f1f021def8dd1fcd81deb16f1bb0d989f3',
--},
{
    src = 'https://github.com/nvim-mini/mini.nvim',
    version = 'v0.18.0'
},
{
    src = 'https://github.com/christoomey/vim-tmux-navigator',
    version = '412c474e97468e7934b9c217064025ea7a69e05e',
},
{
    src = 'https://github.com/folke/tokyonight.nvim',
    version = 'v4.14.1',
},
--{
--    src = 'https://github.com/tpope/vim-surround',
--    version = 'v2.2',
--},
--{
--    src = 'https://github.com/nvim-tree/nvim-tree.lua',
--    version = 'v1.18.0',
--},
{
    src = 'https://github.com/folke/which-key.nvim',
    version = 'v3.17.0',
},
--{
--    src = 'https://github.com/NvChad/ui',
--    version = '222c8cc1ad66076c05b7c9d0695781ebe3799d880',
--}
--
{ src = "https://github.com/hrsh7th/nvim-cmp" },
{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
{ src = "https://github.com/hrsh7th/cmp-buffer" },
{ src = "https://github.com/hrsh7th/cmp-path" },
{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
--
})

local cnip = require("luasnip")
--
require("cmp").setup({
snippet = {
  expand = function(args)
    cnip.lsp_expand(args.body)
  end,
},
view = {
  entries = "native",
},
mapping = require("cmp").mapping.preset.insert({
  ["<Tab>"] = require("cmp").mapping(function(fallback)
    if require("cmp").visible() then
      require("cmp").select_next_item()
    elseif cnip.expand_or_jumpable() then
      cnip.expand_or_jump()
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<S-Tab>"] = require("cmp").mapping(function(fallback)
    if require("cmp").visible() then
      require("cmp").select_prev_item()
    elseif cnip.jumpable(-1) then
      cnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<CR>"] = require("cmp").mapping.confirm({ select = false }),
  ["<C-e>"] = require("cmp").mapping.abort(),
}),
--
sources = require("cmp").config.sources({
  { name = "nvim_lsp" },
  { name = "luasnip" },
},
{
  { name = "buffer" },
  { name = "path" },
}),
})

-- nvchad (ui only)
--require("nvchad").setup({
--  require "nvchad"
--})

-- blinkcmp
-- require("blink.cmp").setup({
-- snippets = { preset = "luasnip" },
-- keymap = {
--   preset = "default",
--   ["<Tab>"]      = { "snippet_forward", "select_next", "fallback" },
--   ["<S-Tab>"]    = { "snippet_backward", "select_prev", "fallback" },
--   ["<CR>"]       = { "accept", "fallback" },
--   ["<leader>lh"] = { "show", "show_documentation", "hide_documentation" },
--   ["<C-e>"]      = { "hide", "fallback" },
--   ["<C-b>"]      = { "scroll_documentation_up", "fallback" },
--   ["<C-f>"]      = { "scroll_documentation_down", "fallback" },
-- },
-- --
-- window = {
--   max_height = 10,
--   max_width = 60,
--   border = 'rounded',
--   winblend = 0,
--   winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder',
--   -- Posición personalizada
--   autocomplete_window = {
--     enabled = true,
--   },
-- },
-- --
-- completion = {
--   documentation = {
--     auto_show = true,
--     auto_show_delay_ms = 300,
--   },
--   ghost_text = {
--     enabled = true,
--   },
--   list = {
--     selection = {
--       preselect = false,
--       auto_insert = false,
--     },
-- },
-- --
-- menu = {
--   auto_show = true,
-- },
-- --
-- },
--   sources = {
--     -- default = { "lsp", "path", "snippets", "buffer" },
--     default = { "snippets" },
--   },
-- })

-- -- fzf
-- require("fzf-lua").setup({
--   fzf_colors = { true },
--   fzf_opts = {
--     ["--height"]         = "80%",
--   },
--   keymaps = {
--       ["<leader>ff"]  = "files",
--       ["<leader>fg"]  = "live_grep",
--   },
-- })

-- luasnip snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

require("luasnip").config.set_config({
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

-- extend filetypes for snippets
local extft=require("luasnip").filetype_extend
extft( "quarto", { "tex", "markdown" })
extft( "latex", { "tex_pdflatex", "tex" })
extft( "tex", { "tex_pdflatex", "tex" } )
--require("luasnip").filetype_extend("quarto", { "markdown" })

--vim.cmd[[
--" Use Tab to expand and jump through snippets
--imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? s'<Plug>luasnip-expand-or-jump' : '<Tab>' 
--smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
--
--" Use Shift-Tab to jump backwards through snippets
--imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
--smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
--]]

-- whichkey
local wk = require("which-key")
wk.add({
  { "<leader>b", group = "buffer" },
  { "<leader>f", group = "find" },
  { "<leader>g", group = "git" },
  { "<leader>l", group = "lsp" },
  { "<leader>r", group = "run" },
  { "<leader>w", group = "window" },
})


-- mini
require('mini.surround').setup({
  highlight_duration = 400,
  n_lines = 40,
  silent = true,
  mappings = {
    add         = 'sa',       -- add surrounding in Normal and Visual modes
    delete      = 'sd',
    highlight   = 'sh',
    replace     = 'sr',
    --
    find_left   = nil,        -- find surrounding (to the left)
    find        = nil,        -- find next surrounding
    suffix_last = nil,        -- suffix to search with "prev" method
    suffix_next = nil,        -- suffix to search with "next" method
  },
})

require('mini.pairs').setup({
})

require('mini.comment').setup({
  options = {
    ignore_blank_line = false,
  },
  mappings = {
    comment = 'gc',
    comment_line = 'gcc',
    comment_visual = 'gc',
  },
})

require('mini.cursorword').setup({
 delay = 50,
})

require("mini.icons").setup({
})

-- require("mini.tabline").setup({
--   tabpage_section = 'right',  --left, right, none
-- })


--require('mini.statusline').setup({
--})


--require('mini.starter').setup({
--})

-- vim tmux navigator

-- reload configuration
vim.api.nvim_create_user_command('Reloadconfig', 'source $MYVIMRC', {})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
    vim.highlight.on_yank()
    end,
})

-- return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    local line = mark[1]
    local ft = vim.bo.filetype
    if line > 0 and line <= lcount
        and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
        and not vim.o.diff then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
        end,
})

-- command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({
  "*.swp", "*.swo", "*.tmp", "*.temp",  "*.log", "*.bak", "*.old", "*.DS_Store", "Thumbs.db",
  "*.zip", "*.tar", "*.tar.gz","*.rar", "*.7z",
  "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.ico", "*.svg", -- images
  "*.pdf", "*.mp3", "*.mp4", "*.mkv", "*.avi", "*.mov", "*.wav", -- vids
  "*.exe", "*.dll", "*.so", "*.dylib", -- binaries
  "*.bin", "*.img", "*.iso", 
})


-- themes 
vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyonight-night")

-- setuii component to transparent
local function set_transparent()
	local groups = {
    --  
    "NonText",
		"Normal",
		"NormalNC",
		"EndOfBuffer",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		--"ColorColumn",
    --
    "NvimTreeEndOfBuffer",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeWinSeparator",
    "NvimSignColumn",
    --
    "WhichKeyNormal",
    --
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end

set_transparent()
-- 
