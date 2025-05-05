return {
	'nvim-treesitter/nvim-treesitter', 
	dependencies = {
		'nvim-treesitter/playground',
	},
	config = function()
	require('nvim-treesitter.configs').setup {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "java", "javascript", "python", "lua", },

		sync_install = false,

		auto_install = true,

		ignore_install = { "javascript" },


		playground = {
			enable = true,
			disable = {},
			updatetime = 25,
			persist_queries = false,
		},

		highlight = {
			enable = true,

			disable = { "c", "rust" },
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,

			additional_vim_regex_highlighting = false,
		},
	}
end
}
