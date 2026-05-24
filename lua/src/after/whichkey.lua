local wk = require("which-key")

wk.setup({
    preset = "modern",
    delay = 300,
})

wk.add({
    { "<leader>c", group = "Claude" },
    { "<leader>f", group = "Find (telescope)" },
    { "<leader>h", group = "Git hunks" },
    { "<leader>s", group = "Splits" },
})
