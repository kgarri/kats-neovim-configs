return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "superhtml" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                pythohn = { "isort", "black" },
            },
        })
        local format_augroup = vim.api.nvim_create_augroup("format", { clear = true })

        --        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
        --          group = format_augroup,

        --        callback = function()
        --          conform.format({
        --          lsp_fallback = true,
        --            async = false,
        --        timeout_ms = 500,
        --  })
        --  end,
        --  })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range" })
    end,
}
