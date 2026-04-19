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
			ensure_installed = { "jdtls", "clangd", "pyright", "lua_ls", "marksman" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--offset-encoding=utf-16",
				},
			})
			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							typeCheckingMode = "basic",
							diagnosticMode = "workspace",
						},
					},
				},
			})
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
			vim.lsp.config("marksman", {
				filetypes = { "markdown" },
			})

			vim.api.nvim_create_autocmd("LspProgress", {
				---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
				callback = function(ev)
					local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
					vim.notify(vim.lsp.status(), "info", {
						id = "lsp_progress",
						title = "LSP Progress",
						opts = function(notif)
							notif.icon = ev.data.params.value.kind == "end" and " "
								or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
						end,
					})
				end,
			})

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
		"mfussenegger/nvim-jdtls",
		dependencies = { "mason-org/mason.nvim" },
		ft = { "java" },
		config = function()
			local jdtls = require("jdtls")

			local jdtls_path = vim.fn.expand("$MASON/packages/jdtls")
			local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

			local os_config
			if vim.fn.has("mac") == 1 then
				os_config = "mac"
			elseif vim.fn.has("win32") == 1 then
				os_config = "win"
			else
				os_config = "linux"
			end

			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

			local config = {
				cmd = {
					"java",
					"-Declipse.application=org.eclipse.jdt.ls.core.id1",
					"-Dosgi.bundles.defaultStartLevel=4",
					"-Declipse.product=org.eclipse.jdt.ls.core.product",
					"-Dlog.level=ALL",
					"-Xmx2g",
					"--add-modules=ALL-SYSTEM",
					"--add-opens",
					"java.base/java.util=ALL-UNNAMED",
					"--add-opens",
					"java.base/java.lang=ALL-UNNAMED",
					"-jar",
					launcher,
					"-configuration",
					jdtls_path .. "/config_" .. os_config,
					"-data",
					workspace_dir,
				},
				root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
				settings = {
					java = {
						signatureHelp = { enabled = true },
						contentProvider = { preferred = "fernflower" },
						sources = {
							organizeImports = {
								starThreshold = 9999,
								staticStarThreshold = 9999,
							},
						},
					},
				},
				on_attach = function(_, bufnr)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
					end
					map("<leader>jo", jdtls.organize_imports, "JDTLS: Organize imports")
					map("<leader>jv", jdtls.extract_variable, "JDTLS: Extract variable")
					map("<leader>jm", jdtls.extract_method, "JDTLS: Extract method")
				end,
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function()
					jdtls.start_or_attach(config)
				end,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = { "google-java-format", "clang-format", "black", "isort", "stylua", "prettierd" },
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
