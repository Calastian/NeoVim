local config = require("config")

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { config.telescope.findfile, function() require("telescope.builtin").find_files() end, desc = "Find files" },
        { config.telescope.livegrep, function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
    },
}
