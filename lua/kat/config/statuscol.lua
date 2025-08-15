local statuscol = {}

statuscol.foldcol = function()
    local foldlevel = vim.fn.foldlevel(vim.v.lnum)
    local foldlevel_before = vim.fn.foldlevel((vim.v.lnum - 1) >= 1 and vim.v.lnum - 1 or 1)
    local foldlevel_after = vim.fn.foldlevel((vim.v.lnum + 1) <= vim.fn.line("$") and (vim.v.lnum + 1) or
        vim.fn.line("$"))
    local foldclosed = vim.fn.foldclosed(vim.v.lnum);

    -- Line has nothing to do with folds so we will skip it
    if foldlevel == 0 then
        return " ";
    end

    -- Line is a closed fold(I know second condition feels unnecessary but I will still add it)
    if foldclosed ~= -1 and foldclosed == vim.v.lnum then
        return "%#Coffin#󰭿";
    end

    -- I didn't use ~= because it couldn't make a nested fold have a lower level than it's parent fold and it's not something I would use
    if foldlevel > foldlevel_before then
        return "%#Bat#󰭟";
    end

    -- The line is the last line in the fold
    if foldlevel > foldlevel_after then
        return " ";
    end

    -- Line is in the middle of an open fold
    return " ";
end

statuscol.numbers = function(config)
    if config.type == "normal" then
        return "%#LineNr" .. vim.v.lnum;
    elseif config.type == "relative" then
        return "%#LineNr#" .. vim.v.relnum;
    else
        -- If the relative number for a line is 0 then we know the cursor is on that line. So, we will show it's line number instead of the relative line number
        return vim.v.relnum == 0 and "%#Focus#" .. vim.v.lnum or "%#LineNr#" .. vim.v.relnum;
    end
end

statuscol.statuscol = function()
    vim.api.nvim_set_hl(0, "Bat", {
        fg = "#b31313"
    })

    vim.api.nvim_set_hl(0, "Focus", {
        fg = "#8D7AA4"
    })

    vim.api.nvim_set_hl(0, "Coffin", {
        fg = "#563F8D"
    })

    local text = table.concat({
        statuscol.foldcol(),
        " ",
        statuscol.numbers({ type = "hybrid" })
    })
    return text
end

return statuscol;
