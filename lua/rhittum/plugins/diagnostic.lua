return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
		preset = "modern",
		transparent_cursorline = true,

		options = {
			multilines = { enabled = true },
			show_source = { enabled = true },
			override_open_float = true,
		},
		hi = {
			error = "DiagnosticError",     -- Highlight for error diagnostics
			warn = "DiagnosticWarn",       -- Highlight for warning diagnostics
			info = "DiagnosticInfo",       -- Highlight for info diagnostics
			hint = "DiagnosticHint",       -- Highlight for hint diagnostics
			arrow = "NonText",             -- Highlight for the arrow pointing to diagnostic
			background = "CursorLine",     -- Background highlight for diagnostics
			mixing_color = "Normal",       -- Color to blend background with (or "None")
		},
		throttle = 20,
		softwrap = 30,
		add_messages = {
			message = true,
			display_count = false,
			use_max_severity = false,
			show_multiple_glyphs = true,
		},
		signs = {
			left = "",
			right = "",
			diag = "●",
			arrow = "    ",
			up_arrow = "    ",
			vertical = " │",
			vertical_end = " └",
		},
		blend = {
			factor = 0.22,
		},
	})
        vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics

	vim.keymap.set("n", "<leader>de", "<cmd>TinyInlineDiag enable<cr>", { desc = "Enable diagnostics" })
	vim.keymap.set("n", "<leader>dd", "<cmd>TinyInlineDiag disable<cr>", { desc = "Disable diagnostics" })
	vim.keymap.set("n", "<leader>dt", "<cmd>TinyInlineDiag toggle<cr>", { desc = "Toggle diagnostics" })
	vim.keymap.set("n", "<leader>dc", "<cmd>TinyInlineDiag toggle_cursor_only<cr>", { desc = "Toggle cursor-only diagnostics" })
	vim.keymap.set("n", "<leader>dr", "<cmd>TinyInlineDiag reset<cr>", { desc = "Reset diagnostic options" })

    end,
}
