require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua", "vim", "vimdoc", "query",
        "c", "cpp", "rust", "go", "python", "java", "zig", "c_sharp",
        "javascript", "typescript", "tsx", "html", "css", "vue", "svelte",
        "astro", "json", "yaml", "toml", "xml",
        "markdown", "markdown_inline",
        "bash", "powershell", "dockerfile", "terraform", "sql",
    },
    highlight = { enable = true },
})
