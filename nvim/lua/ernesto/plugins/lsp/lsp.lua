return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		keys = {
			{ "<leader>ms", ":Mason<CR>", desc = "Mason: Open mason" },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = { "lua_ls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = { checkThirdParty = false },
					},
				},
			})
			vim.lsp.enable("lua_ls")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
					end

					map("gd", vim.lsp.buf.definition, "LSP: Go to definition")
					map("gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
					map("<leader>ca", vim.lsp.buf.code_action, "LSP: Code actions")
					map("<leader>rn", vim.lsp.buf.rename, "LSP: Rename symbols in all files")
					map("<leader>lh", vim.lsp.buf.hover, "LSP: Show information about a symbol (HOVER)")
					map("]d", function()
						vim.diagnostic.jump({ count = 1 })
					end, "LSP: Next diagnostic")
					map("[d", function()
						vim.diagnostic.jump({ count = -1 })
					end, "LSP: Previous diagnostic")
				end,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = { "stylua" },
		},
	},
}
