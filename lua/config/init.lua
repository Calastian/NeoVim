return {
    theme = {
        style = "catppuccin",
        mode = "dark",
    },
    editor = {
        line_numbers = true,
        relative_line_numbers = true,
        highlight_line = true,
        tab_size = 4,
    },
    bufferline = {
        close = "<leader>q",
        save = "<leader>w",
        tab_right = "<TAB>",
        tab_left = "<S-TAB>",
    },
    filetree = {
        jump_to = "<C-h>",
        toggle = "<C-n>",
    },
    telescope = {
        findfile = "<leader>ff",
        livegrep = "<leader>fg",
    },
    terminal = {
        toggle = "<C-\\>"
    },
    claude = {
        toggle = "<leader>cc",
        focus = "<leader>cf",
        send = "<leader>cs",          -- send selection (visual) or buffer (normal)
        diagnostics = "<leader>cd",   -- send diagnostics to Claude
        add_buffer = "<leader>cb",    -- @-mention current buffer
        accept_diff = "<leader>ca",
        deny_diff = "<leader>cx",
    },
    gitsigns = {
        next_hunk = "]c",
        prev_hunk = "[c",
        stage_hunk = "<leader>hs",
        reset_hunk = "<leader>hr",
        preview_hunk = "<leader>hp",
        blame_line = "<leader>hb",
    },
    window = {
       nav_left = "<C-Left>",
        nav_down = "<C-Down>",
        nav_up = "<C-Up>",
        nav_right = "<C-Right>",
        split_v = "<leader>sv",
        split_h = "<leader>sh",
        equalize = "<leader>se",
        close = "<leader>sx",
    },
    hotkeys = {
        easy_quit = "<C-q>",

}
