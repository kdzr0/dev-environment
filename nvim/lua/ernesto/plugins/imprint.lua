return {
	"glyccogen/imprint.nvim",
	cmd = "Imprint",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("imprint").setup({
			output_dir = "/mnt/c/Users/KDZERO-PC/Downloads/",
			background = "#232136",
		})
	end,
}
