return{
    "neovim/nvim-lspconfig",
    {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        -- lsp_attach is where you enable features that only work
        -- if there is a language server active in the file
        local lsp_attach = function(client, bufnr)
            local opts = {buffer = bufnr}

            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        cmp.setup({
            mapping ={
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({select = true}),
                ['<C-Space>'] = cmp.mapping.complete(),
            },
            sources = {
                {name = 'nvim_lsp'},
                {name = 'buffer'},
            },
            formatting = cmp_format,

        })


        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),


        })

        require('mason').setup({})
        require('mason-lspconfig').setup({
            enusre_installed = {'lua_ls','rust_analyzer'},
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,

                rust_analyzer = function ()
                    require('lspconfig').rust_analyzer.setup({
                        server = {
                            -- on_attach is a callback called when the language server attachs to the buffer
                            lsp_attach = lsp_attach,
                            settings = {
                                ["rust-analyzer"] = {
                                    imports = {
                                        granularity ={
                                            group = "module",
                                        },
                                        prefix = "self",
                                    },
                                    cargo = {
                                        buidlScripts = {
                                            enable = true
                                        },
                                    },
                                    procMacro = {
                                        enable = true
                                    },
                                    chechOnSave = {
                                        command = "clippy",
                                    },
                                },

                            },
                        },
                        require("rust-tools").setup()

                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }


        })

        lsp_zero.setup_servers({'rust_analyzer','lua_ls'})
    end
}

