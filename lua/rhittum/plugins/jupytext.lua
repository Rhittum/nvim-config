return {
	"GCBallesteros/jupytext.nvim",
	config = true,
	lazy=false,
	style = "markdown",
	output_extension = ".ipynb",  -- Default extension. Don't change unless you know what you are doing
	force_ft = nil,  -- Default filetype. Don't change unless you know what you are doing
	custom_language_formatting = {},
	config = function ()
		require("jupytext").setup({
			style = "markdown",
			output_extension = "md",
			force_ft = "markdown",
		})
	end
}
