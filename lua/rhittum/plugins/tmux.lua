return {
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup({
	    navigation = {
		    enable_default_keybindings = false,
	    }
    }) end,

    vim.keymap.set("n", "<C-o>", [[<cmd>lua require("tmux").move_left()<cr>]]),
    vim.keymap.set("n", "<C-p>", [[<cmd>lua require("tmux").move_bottom()<cr>]]),
    vim.keymap.set("n", "<C-[>", [[<cmd>lua require("tmux").move_top()<cr>]]),
    vim.keymap.set("n", "<C-]>", [[<cmd>lua require("tmux").move_right()<cr>]]),

    vim.keymap.set("n", "<M-o>", [[<cmd>lua require("tmux").resize_left()<cr>]]),
    vim.keymap.set("n", "<M-p>", [[<cmd>lua require("tmux").resize_bottom()<cr>]]),
    vim.keymap.set("n", "<M-[>", [[<cmd>lua require("tmux").resize_top()<cr>]]),
    vim.keymap.set("n", "<M-]>", [[<cmd>lua require("tmux").resize_right()<cr>]]),
}
