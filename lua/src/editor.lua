local config = require("config")


vim.opt.shiftwidth = config.editor.tab_size
vim.opt.tabstop = config.editor.tab_size
vim.opt.softtabstop = config.editor.tab_size
vim.opt.expandtab = true

vim.o.background = config.theme.mode
vim.cmd("colorscheme " .. config.theme.style)

vim.keymap.set("n", config.hotkeys.easy_quit, ":wqa<CR>", {noremap = true, silent = true})

-- Hybrid line numbers: relative in normal mode (for fast `3j`/`5k` jumps),
-- absolute in insert mode (so you see real line numbers while editing).
if config.editor.relative_line_numbers then
    local grp = vim.api.nvim_create_augroup("HybridLineNumbers", { clear = true })
    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
        group = grp,
        callback = function() vim.opt.relativenumber = false end,
    })
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        group = grp,
        callback = function() vim.opt.relativenumber = true end,
    })
end
