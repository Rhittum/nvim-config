return {
	'nvim-telescope/telescope.nvim', tag = 'v0.2.1',
	dependencies = { 'nvim-lua/plenary.nvim',
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
},
	config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
			vim.keymap.set('n', '<leader>gs', function ()
				builtin.grep_string({ search = vim.fn.input('Grep > ') })
			end)
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set('n', '<leader>fh', function ()
				require('telescope.builtin').find_files({
					cwd = vim.fn.expand("~")
				})
			end, { desc = 'Find files in Home '})
	end,
}
