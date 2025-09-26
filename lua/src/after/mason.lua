require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = { 
        -- System Languages (verified names)
        'lua_ls',           -- Lua ✓
        'clangd',           -- C/C++ ✓ 
        'cmake',            -- CMake ✓
        'rust_analyzer',    -- Rust ✓
        'gopls',            -- Go ✓
        'pylsp',            -- Python ✓
        'jdtls',            -- Java ✓
        'omnisharp',        -- C# ✓
        
        -- Web Development (verified names)
        'ts_ls',            -- TypeScript/JavaScript ✓
        'html',             -- HTML ✓
        'cssls',            -- CSS ✓
        'tailwindcss',      -- Tailwind CSS ✓
        'emmet_ls',         -- Emmet ✓
        'vue_ls',           -- Vue.js ✓ (volar is deprecated)
        'svelte',           -- Svelte ✓
        'astro',            -- Astro ✓
        
        -- Data & Config (verified names)
        'jsonls',           -- JSON ✓
        'yamlls',           -- YAML ✓
        'taplo',            -- TOML ✓
        'lemminx',          -- XML ✓
        
        -- Markup & Documentation (verified names)
        'marksman',         -- Markdown ✓
        'ltex',             -- LaTeX/Grammar ✓
        
        -- Shell & DevOps (verified names)
        'bashls',           -- Bash ✓
        'powershell_es',    -- PowerShell ✓
        'dockerls',         -- Dockerfile ✓
        'docker_compose_language_service', -- Docker Compose ✓
        'terraformls',      -- Terraform ✓ (corrected)
        'helm_ls',          -- Helm ✓
        
        -- Database (verified names)
        'sqlls',            -- SQL ✓
        
        -- Other Popular Languages (verified names)
        'intelephense',     -- PHP ✓ (corrected - better than phpactor)
        'kotlin_language_server', -- Kotlin ✓
        'julials',          -- Julia ✓
        'elixirls',         -- Elixir ✓
        'zls',              -- Zig ✓ 
        'nim_langserver',   -- Nim ✓
        'crystalline',      -- Crystal ✓
    },
    automatic_installation = true,
})
