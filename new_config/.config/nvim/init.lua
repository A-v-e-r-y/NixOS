
-- options
local o = vim.o
local w = vim.wo
local b = vim.bo

o.number = true
o.relativenumber = true
o.shiftwidth = 2
o.mouse = ''

-- keymaps
local map = vim.api.nvim_set_keymap
opts = { silent = true, noremap = true }
map('n', '<Tab>', ':tabn<CR>', opts)
map('n', '<S-Tab>', ':tabp<CR>', opts)
map('n', '<Space>b', ':buffers<CR>', opts)

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup("plugins")
