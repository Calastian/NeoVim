-- LSP + autocomplete stack. lsp-zero is intentionally NOT included --
-- it's deprecated in favor of nvim 0.11's built-in `vim.lsp.config` /
-- `vim.lsp.enable` API.
--
-- Each plugin's heavy setup runs in its `config` callback so the eager
-- requires in after/ don't pull everything in at startup.
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            require("src.after.lspzero")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = { { name = "nvim_lsp" } },
                mapping = {
                    ["<Enter>"] = cmp.mapping.confirm({ select = false }),
                    ["<Esc>"]   = cmp.mapping.abort(),
                    ["<Up>"]    = cmp.mapping.select_prev_item({ behavior = "select" }),
                    ["<Down>"]  = cmp.mapping.select_next_item({ behavior = "select" }),
                    ["<C-p>"]   = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = "insert" })
                        else
                            cmp.complete()
                        end
                    end),
                    ["<C-n>"]   = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = "insert" })
                        else
                            cmp.complete()
                        end
                    end),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })
        end,
    },
    { "hrsh7th/cmp-nvim-lsp", lazy = true },
    { "L3MON4D3/LuaSnip",     lazy = true },
}
