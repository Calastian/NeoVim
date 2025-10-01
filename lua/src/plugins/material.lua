return {
    "marko-cerovac/material.nvim",
    name = "material",
    priority = 999,
    lazy = true,
    config = function()
        require('material').setup({
            contrast = {
                terminal = false,
                sidebars = false,
                floating_windows = false,
                cursor_line = false,
                non_current_windows = false,
                filetypes = {},
            },
            styles = {
                comments = { italic = true },
                strings = { },
                keywords = { },
                functions = { },
                variables = {},
                operators = {},
                types = {},
            },
            plugins = {
                "dap",
                "dashboard",
                "gitsigns",
                "hop",
                "indent-blankline",
                "lspsaga",
                "mini",
                "neogit",
                "nvim-cmp",
                "nvim-navic",
                "nvim-tree",
                "nvim-web-devicons",
                "sneak",
                "telescope",
                "trouble",
                "which-key",
            },
            disable = {
                colored_cursor = false,
                borders = false,
                background = false,
                term_colors = false,
                eob_lines = false
            },
            high_visibility = {
                lighter = false,
                darker = false
            },
            lualine_style = "default",
            async_loading = true,
        })
    end,
}
