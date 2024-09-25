function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0,"Normal", {bg ="none"})
	vim.api.nvim_set_hl(0,"NormalFloat", {bg ="none"})
    vim.api.nvim_set_hl(0,"nCursor",{fg= "#f5b1cc", bg = "#f5b1cc"})

end

ColorMyPencils()
