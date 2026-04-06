return {
	"glyccogen/imprint.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Imprint",
	config = function()
		require("imprint").setup({
			output_dir = "/mnt/c/Users/KDZERO-PC/Downloads/",
			background = "#1e1e2e",
		})
	end,
}
