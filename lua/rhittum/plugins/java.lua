return {
	'nvim-java/nvim-java',
	config = function()
		require('java').setup()
		spring_boot_tools = {
			enable = true,
			version = '1.55.1',
		}
		vim.lsp.enable('jdtls')
	end,
}
