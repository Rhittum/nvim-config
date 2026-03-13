return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = "Add file to Harpoon"})

		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Toggle Harpoon menu"})

		vim.keymap.set("n", "<C-H>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-J>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-K>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-L>", function() harpoon:list():select(4) end)

	end
}
