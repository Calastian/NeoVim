local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Auto Complete:
local cmp = require('cmp')

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

-- LSP Language Configuration (nvim 0.11+ vim.lsp.config API):
local servers = {
    lua_ls = {
        settings = {
            diagnostics = { globals = { 'vim' } },
        },
    },
    clangd = {},
    cmake = {
        filetypes = { "cmake", "CMakeLists.txt" },
    },
    pylsp = {},
    gopls = {
        settings = {
            gopls = {
                analyses = { unusedparams = true },
                staticcheck = true,
                gofumpt = true,
            },
        },
    },
    hls = {},
    jsonls = {
        filetypes = { "json", "mcmeta" },
    },
}

for name, opts in pairs(servers) do
    vim.lsp.config(name, opts)
    vim.lsp.enable(name)
end
