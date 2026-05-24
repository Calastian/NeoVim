local config = require("config")

local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Window navigation
map("n", config.window.nav_left,  "<C-w>h", "Move to left split")
map("n", config.window.nav_down,  "<C-w>j", "Move to split below")
map("n", config.window.nav_up,    "<C-w>k", "Move to split above")
map("n", config.window.nav_right, "<C-w>l", "Move to right split")

-- Split management
map("n", config.window.split_v,  "<cmd>vsplit<cr>", "Split vertically")
map("n", config.window.split_h,  "<cmd>split<cr>",  "Split horizontally")
map("n", config.window.equalize, "<C-w>=",          "Equalize split sizes")
map("n", config.window.close,    "<cmd>close<cr>",  "Close current split")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear search highlight")

-- Keep cursor centered on half-page jumps and search
map("n", "<C-d>", "<C-d>zz", "Half-page down (centered)")
map("n", "<C-u>", "<C-u>zz", "Half-page up (centered)")
map("n", "n",     "nzzzv",   "Next search match (centered)")
map("n", "N",     "Nzzzv",   "Prev search match (centered)")

-- Move selected lines
map("v", "J", ":m '>+1<cr>gv=gv", "Move selection down")
map("v", "K", ":m '<-2<cr>gv=gv", "Move selection up")

-- Stay in visual mode after indent
map("v", "<", "<gv", "Indent left, keep selection")
map("v", ">", ">gv", "Indent right, keep selection")
