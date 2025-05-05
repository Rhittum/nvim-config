return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "petertriho/cmp-git",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
	{ name = "buffer" },
	{ name = "path" },
	{ name = "git" },
}),
    })
    cmp.setup.filetype('gitcommit', {
	    sources = cmp.config.sources({
		    { name = 'git' },
	    }, {
		    { name = 'buffer' },
	    })
    })
    require("cmp_git").setup()

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('lspconfig')['jdtls'].setup {
	    capabilities = capabilities,
	    root_dir = require('lspconfig.util').root_pattern('pom.xml', 'build.gradle', '.git'),
    }
    require('lspconfig')['ast-grep'].setup {
	    capabilities = capabilities,
    }
    require('lspconfig')['pyright'].setup {
	    capabilities = capabilities,
    }
    require('lspconfig')['ts_ls'].setup {
	    capabilities = capabilities,
    }
    require('lspconfig')['lua_ls'].setup {
	    capabilities = capabilities,
    }
    require('lspconfig')['clangd'].setup {
	    capabilities = capabilities,
    }
	    end,
}
