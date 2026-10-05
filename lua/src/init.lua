vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local config = require("config")
vim.opt.number = config.editor.line_numbers
-- vim.opt.relativenumber = config.editor.relative_line_numbers
vim.o.cursorline = config.editor.highlight_line

require("src.lazy")
require("src.editor")
require("src.mapping")

require("src.my_plugins")

-- Setup theme switcher
require("src.theme_switcher").setup()

vim.opt.laststatus = 3
