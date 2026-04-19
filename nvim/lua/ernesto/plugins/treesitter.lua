return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"java",
			"c",
			"cpp",
			"python",
			"lua",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"bash",
			"zsh",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"java",
				"c",
				"cpp",
				"python",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"bash",
				"zsh",
			},
			callback = function()
				vim.treesitter.start()
			end,
		})

		vim.treesitter.language.register("bash", "zsh")
	end,
}
