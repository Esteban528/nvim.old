require('settings')
require('keybinds')


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require('gruvbox').load()
-- require('onedark').load()

local custom_gruvbox = require'lualine.themes.gruvbox'
-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = '#1D2021'

require('lualine').setup {
  options = { theme  = custom_gruvbox },
  ...
}
require 'colorizer'.setup()
-- require 'treesitter'.setup()

vim.cmd("colorscheme gruvbox")
