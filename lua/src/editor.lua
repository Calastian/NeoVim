local config = require("config")


vim.opt.shiftwidth = config.editor.tab_size
vim.opt.tabstop = config.editor.tab_size
vim.opt.softtabstop = config.editor.tab_size
vim.opt.expandtab = true

vim.o.background = config.theme.mode
vim.cmd("colorscheme " .. config.theme.style)

vim.keymap.set("n", config.hotkeys.easy_quit, ":wqa<CR>", {noremap = true, silent = true})
