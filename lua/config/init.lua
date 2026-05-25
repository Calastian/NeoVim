return {
    theme = {
        style = "yorumi",
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
        toggle = "<leader>cc",   -- toggle Claude split (works in n/v)
        focus  = "<leader>cf",   -- jump cursor back into the Claude split
        send   = "<leader>cs",   -- send buffer (normal) / selection (visual)
        prompt = "<leader>cp",   -- pick from prompt templates
        ask    = "<leader>ca",   -- type a one-off question, send it
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
    },
}
