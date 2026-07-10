-- neovim config

-- builtin file tree
vim.g.netrw_list_style = 3
vim.g.netrw_winsize = 30

-- performance
vim.opt.redrawtime = 1000                          -- ms to redraw screen
vim.opt.maxmempattern = 12500                      -- 12mb ram usage (5mb default)

-- Basic settings
vim.opt.number = true                              -- line numbers
vim.opt.relativenumber = true                      -- relative line numbers
vim.opt.cursorline = true                          -- highlight current line
vim.opt.wrap = true                                -- wrap lines
vim.opt.scrolloff = 10                             -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8                          -- keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 2                                -- Tab width
vim.opt.shiftwidth = 2                             -- Indent width
vim.opt.softtabstop = 2                            -- Soft tab stop
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.smartindent = true                         -- Smart auto-indenting
vim.opt.autoindent = true                          -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true                          -- Case insensitive search
vim.opt.smartcase = true                           -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                           -- Don't highlight search results
vim.opt.incsearch = true                           -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true                       -- Enable 24-bit colors
vim.opt.signcolumn = "yes"                         -- Always show sign column
vim.opt.colorcolumn = "150"                        -- Show column at _ characters
vim.opt.showmatch = true                           -- Highlight matching brackets
vim.opt.matchtime = 2                              -- How long to show matching bracket
vim.opt.cmdheight = 1                              -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"  -- Completion options
vim.opt.showmode = false                           -- Don't show mode in command line
vim.opt.pumheight = 10                             -- Popup menu height
vim.opt.pumblend = 10                              -- Popup menu transparency
vim.opt.winblend = 0                               -- Floating window transparency
vim.opt.conceallevel = 0                           -- Don't hide markup
vim.opt.concealcursor = ""                         -- Don't hide cursor line markup
vim.opt.lazyredraw = true                          -- Don't redraw during macros
vim.opt.synmaxcol = 300                            -- Syntax highlighting limit

-- File handling
vim.opt.backup = false                             -- Create backup files
vim.opt.writebackup = false                        -- Create backup before writing
vim.opt.swapfile = false                           -- Create swap files
vim.opt.undofile = true                            -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")  -- Undo directory
vim.opt.updatetime = 150                           -- Faster completion
vim.opt.timeoutlen = 150                           -- Key timeout duration
vim.opt.ttimeoutlen = 200                          -- Key code timeout
vim.opt.autoread = true                            -- Auto reload files changed outside vim
vim.opt.autowrite = false                          -- Don't auto save

-- Behavior settings
vim.opt.hidden = true                              -- Allow hidden buffers
vim.opt.errorbells = false                         -- No error bells
vim.opt.backspace = "indent,eol,start"             -- Better backspace behavior
vim.opt.autochdir = false                          -- Don't auto change directory
vim.opt.iskeyword:append("-")                      -- Treat dash as part of word
vim.opt.path:append("**")                          -- include subdirectories in search
vim.opt.selection = "exclusive"                    -- Selection behavior
vim.opt.mouse = "a"                                -- Enable mouse support
vim.opt.clipboard:append("unnamedplus")            -- Use system clipboard
vim.opt.modifiable = true                          -- Allow buffer modifications
vim.opt.encoding = "utf-8"                         -- Set encoding

-- Cursor settings
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Folding settings
vim.opt.foldmethod = "expr"                        -- Use expression for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"    -- Use treesitter for folding
vim.opt.foldlevel = 99                             -- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true                          -- Horizontal splits go below
vim.opt.splitright = true                          -- Vertical splits go right

-- keybinds
-- Key mappings
vim.g.mapleader = " "                              -- Set leader key to space
vim.g.maplocalleader = " "                         -- Set local leader key (NEW)

-- Compile with leader + s
vim.keymap.set('n', '<leader>c', ':w!<CR>:!compilerdoc "%:p"<CR>', { silent = true })

-- Normal mode mappings
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- g + h, To enter normal mode
-- vim.api.nvim_set_keymap('i', 'gh', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Save :W, with Leader + s
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })

-- Yank to the 'end of line'.
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Better paste behavior
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>rl", ":so $MYVIMRC<CR>", { desc = "Reload config" })

-- plugins
vim.pack.add({
--
{
    src = 'https://github.com/L3MON4D3/LuaSnip', -- Url
    version = 'v2.5.0',  -- Git branch, tag or commit hash
},
{
    src = 'https://github.com/hrsh7th/nvim-cmp',
    version = 'v0.0.2',
},
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
{
    src = 'https://github.com/nvim-tree/nvim-tree.lua',
    version = 'v1.18.0',
}
--
})

-- luasnip snippets
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})
require("luasnip").config.set_config({
  enable_autosnippets = true,         -- autotrigger snippets
  store_selection_keys = "<Tab>",      -- trigger visual selection
})

vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

-- mini
require('mini.comment').setup({

})

require('mini.cursorword').setup({
  delay = 50,
})

require("mini.icons").setup({

})

require("mini.tabline").setup({
  tabpage_section = 'right',  --left, right, none
})

-- file explorer
-- vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
-- vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

local TREE_HEIGHT_RATIO = 0.8
local TREE_WIDTH_RATIO = 0.5

require("nvim-tree").setup({
  filters = {
	  dotfiles = false,
  },
  renderer = {
	  group_empty = true,
  },
--
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * TREE_WIDTH_RATIO
        local window_h = screen_h * TREE_HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
        end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * TREE_WIDTH_RATIO)
    end,
  },
})

vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })

-- surround
require('mini.surround').setup({

})

require('mini.statusline').setup({
})


require('mini.starter').setup({
})

-- vim tmux navigator

-- nvim-cmp

-- functions

-- Reload Config
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

-- autocmds

-- themes 
vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyonight-night")

local function set_transparent() -- set UI component to transparent
	local groups = {
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
		"ColorColumn",
    -- nvim tree background
    "NvimTreeEndOfBuffer",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeWinSeparator",
    "NvimSignColumn",
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end

set_transparent()
-- 
