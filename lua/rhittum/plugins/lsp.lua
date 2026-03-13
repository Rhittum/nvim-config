return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"b0o/schemastore.nvim",
		-- "mfussenegger/nvim-jdtls",
	},

	config = function ()
		require("conform").setup({
		})
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require("fidget").setup({})
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "ts_ls", "rust_analyzer", "clangd", "yamlls", "html", "jdtls", "neocmake", "bashls", "jsonls", },
		})
		vim.lsp.config('neocmake', {
			capabilities = capabilities,
			-- root_dir = lspconfig.util.root_pattern(".git", "CMakeLists.txt", ".neocmake.toml", "build", "cmake" ),
		})
		vim.lsp.enable('neocmake')
		vim.lsp.config('lua_ls', {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath('config')
						and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using (most
							-- likely LuaJIT in the case of Neovim)
							version = 'LuaJIT',
							-- Tell the language server how to find Lua modules same way as Neovim
							-- (see `:h lua-module-load`)
							path = {
								'lua/?.lua',
								'lua/?/init.lua',
							},
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								-- Depending on the usage, you might want to add additional paths
								-- here.
								-- '${3rd}/luv/library',
								-- '${3rd}/busted/library',
							},
							-- Or pull in all of 'runtimepath'.
							-- NOTE: this is a lot slower and will cause issues when working on
							-- your own configuration.
							-- See https://github.com/neovim/nvim-lspconfig/issues/3189
							-- library = vim.api.nvim_get_runtime_file('', true),
						},
					})
				end,
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' },
						},
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
							}
						},
					},
				},
			})
			vim.lsp.enable('lua_ls')
			vim.lsp.enable('pyright')
			vim.lsp.enable('ts_ls')
			vim.lsp.config('rust_analyzer', {
				settings = {
					['rust_analyzer'] = {
						diagnostics = {
							enable = false,
						}
					}
				}
			})
			vim.lsp.enable('rust_analyzer')
			vim.lsp.enable('clangd')
			vim.lsp.config('yamlls', {
				settings = {
					yaml = {
						schemas = {
							["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
							["../path/relative/to/file.yml"] = "/.github/workflows/*",
							["/path/from/root/of/project"] = "/.github/workflows/*",
						},
					},
				}
			})
			vim.lsp.enable('yamlls')
			vim.lsp.config('html', {
				capabilities = capabilities,
			})
			vim.lsp.enable('html')
			vim.lsp.config.bashls = {
				cmd = { 'bash-language-server', 'start' },
				filetypes = { 'bash', 'sh' },
			}
			vim.lsp.enable 'bashls'
			vim.lsp.config('jsonls', {
				settings = {
					json = {
						schemas = require('schemastore').json.schemas(),
						validate = { enable = true },
					},
				},
			})
			vim.lsp.enable('jsonls')
			-- vim.lsp.enable('jdtls')

			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = "copilot", group_index = 2 },
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }, -- For luasnip users.
				}, {
					{ name = 'buffer' },
				})
			})
			vim.diagnostic.config({
				-- update_in_insert = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
	end,
}
