require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = { 
        -- System Languages
        'lua_ls',           -- Lua
        'clangd',           -- C/C++
        'cmake',            -- CMake
        'rust_analyzer',    -- Rust
        'gopls',            -- Go
        'pylsp',            -- Python
        'jdtls',            -- Java
        'omnisharp',        -- C#
        
        -- Web Development
        'ts_ls',            -- TypeScript/JavaScript
        'html',             -- HTML
        'cssls',            -- CSS
        'tailwindcss',      -- Tailwind CSS
        'emmet_ls',         -- Emmet
        'vue_ls',           -- Vue.js
        'svelte',           -- Svelte
        'astro',            -- Astro
        
        -- Data & Config
        'jsonls',           -- JSON
        'yamlls',           -- YAML
        'taplo',            -- TOML
        'lemminx',          -- XML
        
        -- Markup & Documentation
        'marksman',         -- Markdown
        'ltex',             -- LaTeX/Grammar
        
        -- Shell & DevOps
        'bashls',           -- Bash
        'powershell_es',    -- PowerShell
        'dockerls',         -- Dockerfile
        'docker_compose_language_service', -- Docker Compose
        'terraform_ls',     -- Terraform
        'helm_ls',          -- Helm
        
        -- Database
        'sqlls',            -- SQL
        
        -- Other Popular Languages
        'phpactor',         -- PHP
        'ruby_lsp',         -- Ruby
        'kotlin_language_server', -- Kotlin
        'sourcekit',        -- Swift
        'r_language_server', -- R
        'julials',          -- Julia
        'elixirls',         -- Elixir
        'erlangls',         -- Erlang
        'zls',              -- Zig
        'nim_langserver',   -- Nim
        'crystalline',      -- Crystal
        'dartls',           -- Dart
        'metals',           -- Scala
        'fsautocomplete',   -- F#
        'ocamllsp',         -- OCaml
        'hls',              -- Haskell (if it works in your environment)
        
        -- Assembly & Low Level
        'asm_lsp',          -- Assembly
        
        -- Configuration Languages
        'nginx_language_server', -- Nginx
    },
    automatic_installation = true,
})
