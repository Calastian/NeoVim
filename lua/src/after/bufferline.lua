vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
            icon = "▎",
            separator = "▎",
            padding = 1,
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer",
                text_align = "left",
                separator = true,
            },
        },
        separator_style = "slant",
        always_show_bufferline = true,
    }
}

local config = require("config")

-- Keymap to close a buffer:
vim.keymap.set("n", config.bufferline.close,
    function()
        local buf = vim.api.nvim_get_current_buf()
        if vim.api.nvim_buf_get_option(buf, "filetype") ~= "neo-tree" then 
            if vim.api.nvim_buf_get_option(buf, "buflisted") then
                vim.cmd("BufferLineCycleNext")
                vim.cmd("bdelete " .. buf)
            end
        end
    end,
    { noremap = true, silent = true }
)

-- Keymap to save a file:
vim.keymap.set("n", config.bufferline.save,
    function()
        local buf = vim.api.nvim_get_current_buf()
        if vim.api.nvim_buf_get_option(buf, "filetype") ~= "neo-tree" then
            vim.cmd(":w")
        end
    end
)

-- Keymaps for switching buffers.
vim.keymap.set("n", config.bufferline.tab_right, ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", config.bufferline.tab_left, ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
