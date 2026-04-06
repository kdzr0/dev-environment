return {
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
}
