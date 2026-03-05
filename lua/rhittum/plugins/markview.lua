return {
  --[[  "OXY2DEV/markview.nvim",
    -- lazy = false,
    -- Disable automatic previews.
    require("markview").setup({
	    preview = { enable = false }
    }),

    vim.api.nvim_set_keymap("n", "<leader>m", "<CMD>Markview<CR>", { desc = "Toggles `markview` previews globally." });
    vim.api.nvim_set_keymap("n", "<leader>s", "<CMD>Markview splitToggle<CR>", { desc = "Toggles `splitview` for current buffer." });
    vim.api.nvim_set_keymap("i", "<Ctrl-m>", "<CMD>Markview HybridToggle<CR>", { desc = "Toggles `hybrid mode` globally." });

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
    ]]
}
