return {
    "mbbill/undotree",

    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        vim.g.undotree_DiffCommand = "FC" --this is only set so windows systems so they can use the undotree
    end
}
