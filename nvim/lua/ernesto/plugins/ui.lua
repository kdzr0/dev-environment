return {
	{
		"Bekaboo/dropbar.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local dropbar = require("dropbar.api")

			vim.keymap.set("n", "<leader>;", dropbar.pick, { desc = "Dropbar: Pick symbols in breadcrumb" })
			vim.keymap.set("n", "[;", dropbar.goto_context_start, { desc = "Dropbar: Go to start of current context" })
			vim.keymap.set("n", "];", dropbar.select_next_context, { desc = "Dropbar: Select next context" })
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
		version = "*",
		config = function()
			local mocha = require("catppuccin.palettes").get_palette("mocha")

			require("bufferline").setup({
				highlights = require("catppuccin.special.bufferline").get_theme({
					styles = { "italic", "bold" },
					custom = {
						all = {
							fill = { bg = "#1e1e2e" },
						},
						mocha = {
							background = { fg = mocha.text },
						},
					},
				}),
				options = {
					mode = "tabs",

					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level)
						local icons = {
							error = "󰅚 ",
							warning = "󰀪 ",
							info = "󰋽 ",
							hint = "󰌶 ",
						}
						return icons[level] and icons[level] .. count or ""
					end,
				},
			})
		end,
	},
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		event = "VeryLazy",
		opts = {
			lsp = {
				progress = { enabled = false },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
				lsp_doc_border = false,
			},
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				auto_integrations = true,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "classic",
				transparent_bg = true,
			})

			local severity = vim.diagnostic.severity

			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					text = {
						[severity.ERROR] = "󰅚 ",
						[severity.WARN] = "󰀪 ",
						[severity.HINT] = "󰌶 ",
						[severity.INFO] = "󰋽 ",
					},
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local lazystatus = require("lazy.status")

			require("lualine").setup({
				options = {
					theme = "catppuccin-nvim",
				},
				sections = {
					lualine_a = {
						{ "mode", icon = { "", align = "left" }, separator = { left = "", right = "" } },
					},
					lualine_b = {
						{ "branch" },
						{
							"diff",
							symbols = { added = " ", modified = " ", removed = " " },
							separator = { right = "" },
						},
					},
					lualine_c = {
						{ "diagnostics" },
					},
					lualine_x = {
						{ lazystatus.updates, cond = lazystatus.has_updates, color = { fg = "#89b4fa" } },
						{ "filetype" },
					},
					lualine_y = {
						{ "progress" },
					},
					lualine_z = {
						{ "location" },
					},
				},
			})
		end,
	},
	{
		"folke/which-key.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
			preset = "icons",
			win = {
				border = "rounded",
				padding = { 1, 2 },
				title = " 󱁤 Menu ",
				title_pos = "center",
				width = 0.7,
				col = 0.5,
			},
			layout = {
				spacing = 5,
				align = "center",
			},
			ui = {
				separator = " ➜ ",
				breadcrumb = "»",
			},
		},
	},
}
