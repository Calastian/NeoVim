local lsp_zero = require('lsp-zero')

-- lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Setup lsp-zero with modern vim.lsp.config
lsp_zero.extend_lspconfig()

-- Auto Complete:
local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    mapping = {
        ['<Enter>'] = cmp.mapping.confirm({select = false}),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
        ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({behavior = 'insert'})
            else
                cmp.complete()
            end
        end),
        ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({behavior = 'insert'})
            else
                cmp.complete()
            end
        end),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

-- LSP Language Configuration with modern vim.lsp.config API:
local capabilities = cmp_lsp.default_capabilities()

-- System Languages
vim.lsp.config.lua_ls = {
    cmd = { 'lua-language-server' },
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    }
}

vim.lsp.config.clangd = {
    cmd = { 'clangd' },
    capabilities = capabilities,
}

vim.lsp.config.cmake = {
    cmd = { 'cmake-language-server' },
    capabilities = capabilities,
    filetypes = { "cmake" }
}

vim.lsp.config.rust_analyzer = {
    cmd = { 'rust-analyzer' },
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = 'clippy',
            },
        },
    }
}

vim.lsp.config.gopls = {
    cmd = { 'gopls' },
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
}

vim.lsp.config.pylsp = {
    cmd = { 'pylsp' },
    capabilities = capabilities,
}

vim.lsp.config.jdtls = {
    cmd = { 'jdtls' },
    capabilities = capabilities,
}

vim.lsp.config.omnisharp = {
    cmd = { 'omnisharp' },
    capabilities = capabilities,
}

-- Web Development
vim.lsp.config.ts_ls = {
    cmd = { 'typescript-language-server', '--stdio' },
    capabilities = capabilities,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
}

vim.lsp.config.html = {
    cmd = { 'vscode-html-language-server', '--stdio' },
    capabilities = capabilities,
}

vim.lsp.config.cssls = {
    cmd = { 'vscode-css-language-server', '--stdio' },
    capabilities = capabilities,
}

vim.lsp.config.tailwindcss = {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    capabilities = capabilities,
}

vim.lsp.config.emmet_ls = {
    cmd = { 'emmet-ls', '--stdio' },
    capabilities = capabilities,
    filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "svelte" }
}

vim.lsp.config.vue_ls = {
    cmd = { 'vue-language-server', '--stdio' },
    capabilities = capabilities,
}

vim.lsp.config.svelte = {
    cmd = { 'svelteserver', '--stdio' },
    capabilities = capabilities,
}

vim.lsp.config.astro = {
    cmd = { 'astro-ls', '--stdio' },
    capabilities = capabilities,
}

-- Data & Config
vim.lsp.config.jsonls = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    capabilities = capabilities,
    filetypes = { "json", "mcmeta" }
}

vim.lsp.config.yamlls = {
    cmd = { 'yaml-language-server', '--stdio' },
    capabilities = capabilities,
}

vim.lsp.config.taplo = {
    cmd = { 'taplo', 'lsp', 'stdio' },
    capabilities = capabilities,
}

vim.lsp.config.lemminx = {
    cmd = { 'lemminx' },
    capabilities = capabilities,
}

-- Markup & Documentation
vim.lsp.config.marksman = {
    cmd = { 'marksman', 'server' },
    capabilities = capabilities,
}

vim.lsp.config.ltex = {
    cmd = { 'ltex-ls' },
    capabilities = capabilities,
    settings = {
        ltex = {
            language = "en-US",
        },
    }
}

-- Shell & DevOps
vim.lsp.config.bashls = {
    cmd = { 'bash-language-server', 'start' },
    capabilities = capabilities,
}

vim.lsp.config.powershell_es = {
    cmd = { 'pwsh', '-NoLogo', '-NoProfile', '-Command', 'PowerShellEditorServices' },
    capabilities = capabilities,
}

vim.lsp.config.dockerls = {
    cmd = { 'docker-langserver', '--stdio' },
    capabilities = capabilities,
}

vim.lsp.config.docker_compose_language_service = {
    cmd = { 'docker-compose-langserver', '--stdio' },
    capabilities = capabilities,
}

vim.lsp.config.terraformls = {
    cmd = { 'terraform-ls', 'serve' },
    capabilities = capabilities,
}

vim.lsp.config.helm_ls = {
    cmd = { 'helm_ls', 'serve' },
    capabilities = capabilities,
}

-- Database
vim.lsp.config.sqlls = {
    cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
    capabilities = capabilities,
}

-- Other Popular Languages
vim.lsp.config.intelephense = {
    cmd = { 'intelephense', '--stdio' },
    capabilities = capabilities,
}

-- vim.lsp.config.ruby_lsp = {
--     cmd = { 'ruby-lsp' },
--     capabilities = capabilities,
-- }

vim.lsp.config.kotlin_language_server = {
    cmd = { 'kotlin-language-server' },
    capabilities = capabilities,
}


-- vim.lsp.config.r_language_server = {
--     cmd = { 'R', '--slave', '-e', 'languageserver::run()' },
--     capabilities = capabilities,
-- }

vim.lsp.config.julials = {
    cmd = { 'julia', '--startup-file=no', '--history-file=no', '-e', 'using LanguageServer; runserver()' },
    capabilities = capabilities,
}

vim.lsp.config.elixirls = {
    cmd = { 'elixir-ls' },
    capabilities = capabilities,
}

-- vim.lsp.config.erlangls = {
--     cmd = { 'erlang_ls' },
--     capabilities = capabilities,
-- }

vim.lsp.config.zls = {
    cmd = { 'zls' },
    capabilities = capabilities,
}

vim.lsp.config.nim_langserver = {
    cmd = { 'nimlsp' },
    capabilities = capabilities,
}

vim.lsp.config.crystalline = {
    cmd = { 'crystalline' },
    capabilities = capabilities,
}



-- vim.lsp.config.metals = {
--     cmd = { 'metals' },
--     capabilities = capabilities,
-- }

-- vim.lsp.config.fsautocomplete = {
--     cmd = { 'fsautocomplete', '--background-service-enabled' },
--     capabilities = capabilities,
-- }

-- vim.lsp.config.ocamllsp = {
--     cmd = { 'ocamllsp' },
--     capabilities = capabilities,
-- }

-- vim.lsp.config.hls = {
--     cmd = { 'haskell-language-server-wrapper', '--lsp' },
--     capabilities = capabilities,
-- }

-- vim.lsp.config.asm_lsp = {
--     cmd = { 'asm-lsp' },
--     capabilities = capabilities,
-- }

vim.lsp.config.nginx_language_server = {
    cmd = { 'nginx-language-server' },
    capabilities = capabilities,
}

-- Enable all configured language servers
vim.lsp.enable({ 
    -- System Languages
    'lua_ls', 'clangd', 'cmake', 'rust_analyzer', 'gopls', 'pylsp', 'jdtls', 'omnisharp',
    -- Web Development  
    'ts_ls', 'html', 'cssls', 'tailwindcss', 'emmet_ls', 'vue_ls', 'svelte', 'astro',
    -- Data & Config
    'jsonls', 'yamlls', 'taplo', 'lemminx',
    -- Markup & Documentation
    'marksman', 'ltex',
    -- Shell & DevOps
    'bashls', 'powershell_es', 'dockerls', 'docker_compose_language_service', 'terraformls', 'helm_ls',
    -- Database
    'sqlls',
    -- Other Languages
    'intelephense', 'kotlin_language_server', 'julials',
    'elixirls', 'zls', 'nim_langserver', 'crystalline',
    'nginx_language_server'
})