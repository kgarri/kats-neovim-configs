require'nvim-treesitter.configs'.setup{

	ensure_installed={"c","lua","rust","vim","vimdoc","query","markdown","markdown_inline","javascript","java","typescript","python"},

	sync_install = false,

	auto_intsall = true,

	highlight = {
		enable = true,

		additonal_vim_regex_highlighting = false,
	},
}
