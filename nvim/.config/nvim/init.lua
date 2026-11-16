require("config.options")
vim.g.mapleader = " "

-- Download and install lazy.nvim if it's not already.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

require("lazy").setup("plugins")

vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })

-- Setups up plugins that need it.
require("bufferline").setup()
require('Comment').setup()
require('nvim-toggler').setup()
require('mini.indentscope').setup()
require("notify").setup({
  background_colour = "#000000",
})

require("bufferline").setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "Files",
        text_align = "center",
        separator = true,
      },
    },
  },
})

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'c', 'lua' }

vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"

local dracula = require("dracula")
dracula.setup({
  -- customize dracula color palette
  colors = {
    bg = "#282A36",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#FF5555",
    orange = "#FFB86C",
    yellow = "#F1FA8C",
    green = "#9EE37D",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
    bright_red = "#FF6E6E",
    bright_green = "#5EF38C",
    bright_yellow = "#FFFFA5",
    bright_blue = "#D6ACFF",
    bright_magenta = "#FF92DF",
    bright_cyan = "#A4FFFF",
    bright_white = "#FFFFFF",
    menu = "#21222C",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
    white = "#ABB2BF",
    black = "#191A21",
  },
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = false, -- default false
  -- use transparent background
  transparent_bg = true, -- default false
  -- set custom lualine background color
  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
  italic_comment = true, -- default false
  -- overrides the default highlights with table see `:h synIDattr`
  overrides = {},
   -- You can use overrides as table like this
  -- overrides = {
  --   NonText = { fg = "white" }, -- set NonText fg to white
  --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
  --   Nothing = {} -- clear highlight of Nothing
  -- },
  -- Or you can also use it like a function to get color from theme
  -- overrides = function (colors)
  --   return {
  --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
  --   }
  -- end,
})

vim.cmd('colorscheme dracula')

require("config.keymappings")
require("config.lualine-config")
require("config.autocmd")
