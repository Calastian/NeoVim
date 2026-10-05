-- LSP keymaps on attach. nvim 0.11 already provides good defaults:
--   K          hover           gd   definition
--   grn        rename          grr  references
--   gri        implementation  gra  code action  (normal + visual)
--   <C-s>      signature help  [d/]d  diagnostic jump
-- We add a few F-key bindings on top for muscle memory.
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
    callback = function(args)
        local opts = { buffer = args.buf, silent = true }
        vim.keymap.set("n",          "<F2>", vim.lsp.buf.rename,                            opts)
        vim.keymap.set("n",          "<F3>", function() vim.lsp.buf.format({ async = true }) end, opts)
        vim.keymap.set({ "n", "x" }, "<F4>", vim.lsp.buf.code_action,                       opts)
    end,
})

-- Global capabilities for every LSP client (enables nvim-cmp LSP sources).
-- Server commands, filetypes, and root_dir come from nvim-lspconfig's `lsp/*.lua`
-- files, which `vim.lsp.config` resolves automatically.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

-- Custom settings for a few servers. These merge on top of the lspconfig defaults.
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    },
})

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})

vim.lsp.config("ltex", {
    settings = {
        ltex = {
            language = "en-US",
        },
    },
})

-- Enable all configured servers (mason installs them; `automatic_enable` is
-- disabled in favor of this explicit list so startup isn't timing-dependent).
vim.lsp.enable({
    -- System
    "lua_ls", "clangd", "cmake", "rust_analyzer", "gopls", "pylsp", "omnisharp",
    -- Web
    "ts_ls", "html", "cssls", "tailwindcss", "emmet_ls", "vue_ls", "svelte", "astro",
    -- Data & Config
    "jsonls", "yamlls", "taplo", "lemminx",
    -- Markup
    "marksman", "ltex",
    -- Shell & DevOps
    "bashls", "dockerls", "docker_compose_language_service", "terraformls",
    -- Database
    "sqlls",
    -- Other
    "zls",
})
