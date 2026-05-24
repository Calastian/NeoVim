local config = require("config")

require("claudecode").setup({
    terminal = {
        split_side = "right",
        split_width_percentage = 0.35,
    },
})

local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

map("n", config.claude.toggle,      "<cmd>ClaudeCode<cr>",            "Claude: toggle window")
map("n", config.claude.focus,       "<cmd>ClaudeCodeFocus<cr>",       "Claude: focus window")
map("n", config.claude.send,        "<cmd>ClaudeCodeSend<cr>",        "Claude: send buffer")
map("v", config.claude.send,        "<cmd>ClaudeCodeSend<cr>",        "Claude: send selection")
map("n", config.claude.diagnostics, "<cmd>ClaudeCodeDiagnostics<cr>", "Claude: send diagnostics")
map("n", config.claude.add_buffer,  "<cmd>ClaudeCodeAdd %<cr>",       "Claude: @-mention buffer")
map("n", config.claude.accept_diff, "<cmd>ClaudeCodeDiffAccept<cr>",  "Claude: accept diff")
map("n", config.claude.deny_diff,   "<cmd>ClaudeCodeDiffDeny<cr>",    "Claude: deny diff")
