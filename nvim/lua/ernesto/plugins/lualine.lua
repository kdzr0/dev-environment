return {
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
}

