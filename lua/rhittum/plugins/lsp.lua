return {
    "williamboman/mason.nvim",
    dependencies = {"williamboman/mason-lspconfig.nvim","neovim/nvim-lspconfig",},
    config = function()
    require("mason").setup({})
    require("mason-lspconfig").setup({
	    ensure_installed = { "lua_ls","pyright", "ts_ls", "jdtls", "rust_analyzer", "clangd",},
    })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    vim.diagnostic.config({
	    virtual_text = true,
	    signs = true,
	    update_in_insert = false,
	    severity_sort = true,
    })
    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "LSP Signature Help" })
    end
}
