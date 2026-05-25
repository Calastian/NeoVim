return {
    {
        "folke/sidekick.nvim",
        dependencies = { "folke/snacks.nvim" },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            input = { enabled = true },
            picker = { enabled = true },
        },
    },
}
