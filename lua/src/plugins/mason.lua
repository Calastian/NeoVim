-- Mason ensure_installed list lives here so the heavy setup() runs in a
-- lazy `config` callback after startup, not eagerly via after/.
--
-- Servers requiring external runtimes you don't have installed are
-- commented out to avoid install/run failures. Uncomment when you
-- install the corresponding toolchain.
local ensure_installed = {
    -- System Languages
    "lua_ls", "clangd", "cmake", "rust_analyzer", "gopls", "pylsp", "omnisharp",
    -- "jdtls",                      -- needs JDK 17+ (you have Java, re-enable if wanted)
    -- "kotlin_language_server",     -- needs Kotlin compiler

    -- Web
    "ts_ls", "html", "cssls", "tailwindcss", "emmet_ls", "vue_ls", "svelte", "astro",

    -- Data & Config
    "jsonls", "yamlls", "taplo", "lemminx",

    -- Markup
    "marksman", "ltex",

    -- Shell & DevOps
    "bashls", "powershell_es", "dockerls", "docker_compose_language_service",
    "terraformls",
    -- "helm_ls",                    -- needs Helm CLI

    -- Database
    "sqlls",

    -- Other
    "zls",                            -- standalone binary, works without sys Zig
    -- "intelephense",                -- needs PHP runtime
    -- "julials",                     -- needs Julia
    -- "elixirls",                    -- needs Elixir
    -- "nim_langserver",              -- needs Nim
    -- "crystalline",                 -- needs Crystal (rough on Windows)
}

return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog" },
        event = "VeryLazy",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                automatic_installation = true,
            })
        end,
    },
}
