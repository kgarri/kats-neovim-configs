return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile"},
    dependencies = {
        "williamboman/mason.nvim",
        "hrsh7th/cmp-nvim-lsp",
        {"antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()

        local lspconfig = require("lspconfig")

        local mason_lspconfig = require("mason-lspconfig")

        local cmp_lsp = require("cmp_nvim_lsp")

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        vim.api.nvim_create_autocmd("Filetype", {
            pattern = { "html", "shtml", "htm" },
            callback = function()
                vim.lsp.start({
                    name = "superhtml",
                    cmd = { "superhtml", "lsp" },
                    root_dir = vim.fs.dirname(vim.fs.find({".git"}, { upward = true })[1])
                })
            end
        })

        mason_lspconfig.setup_handlers(
            {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    lspconfig["lua_ls"].setup {
                        capabilities = capabilities,
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
                ["rust_analyzer"] = function ()
                    lspconfig["rust_analyzer"].setup{
                        capabilities = capabilities,
                        settings = {
                            ["rust-analyzer"] = {
                                imports = {
                                    granularity = {
                                        group = "module",
                                    },
                                    prefix = "self",
                                },
                                cargo = {
                                    buildScripts = {
                                        enable = true,
                                    },
                                },
                                procMacro = {
                                    enable = true
                                },
                            },

                        },
                    }
                end,
                ["ltex"]= function()
                    lspconfig["ltex"].setup{
                        capabilities = capabilities,
                        settings = {
                            ["ltex"] = {
                                language = "en-US"
                            }
                        }
                    }
                end,
            }
        )

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
