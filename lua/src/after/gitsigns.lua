local config = require("config")

require("gitsigns").setup({
    signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
        untracked    = { text = "▎" },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        map("n", config.gitsigns.next_hunk, function()
            if vim.wo.diff then return config.gitsigns.next_hunk end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
        end, "Next hunk")

        map("n", config.gitsigns.prev_hunk, function()
            if vim.wo.diff then return config.gitsigns.prev_hunk end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
        end, "Prev hunk")

        map("n", config.gitsigns.stage_hunk,   gs.stage_hunk,                                  "Stage hunk")
        map("n", config.gitsigns.reset_hunk,   gs.reset_hunk,                                  "Reset hunk")
        map("n", config.gitsigns.preview_hunk, gs.preview_hunk,                                "Preview hunk")
        map("n", config.gitsigns.blame_line,   function() gs.blame_line({ full = true }) end,  "Blame line")
    end,
})
