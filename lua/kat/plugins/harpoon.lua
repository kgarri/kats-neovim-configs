return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "add a new file to harpoon" })

		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "open the quick menu for the harpoon ui" })

		vim.keymap.set("n", "<C-h>", function()
			ui.nav_file(1)
		end, { desc = "navigate to first harpooned file" })

		vim.keymap.set("n", "<C-t>", function()
			ui.nav_file(2)
		end, { desc = "navigate to second  harpooned file" })

		vim.keymap.set("n", "<C-n>", function()
			ui.nav_file(3)
		end, { desc = "navigate to third harpooned file" })

		vim.keymap.set("n", "<C-s>", function()
			ui.nav_file(4)
		end, { desc = "navigate to fourth harpooned file" })
	end,
}
