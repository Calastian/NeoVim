return {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    priority = 999,
    lazy = true,
    config = function()
        require('github-theme').setup({
            options = {
                compile_path = vim.fn.stdpath('cache') .. '/github-theme',
                compile_file_suffix = '_compiled',
                hide_end_of_buffer = true,
                hide_nc_statusline = true,
                transparent = false,
                terminal_colors = true,
                dim_inactive = false,
                module_default = true,
                styles = {
                    comments = 'italic',
                    functions = 'NONE',
                    keywords = 'bold',
                    variables = 'NONE',
                    conditionals = 'NONE',
                    constants = 'NONE',
                    numbers = 'NONE',
                    operators = 'NONE',
                    strings = 'NONE',
                    types = 'NONE',
                },
                inverse = {
                    match_paren = false,
                    visual = false,
                    search = false,
                },
            }
        })
    end,
}
