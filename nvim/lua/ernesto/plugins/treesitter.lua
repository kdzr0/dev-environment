return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"lua",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"bash",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc", "bash", "zsh" },
			callback = function()
				vim.treesitter.start()
			end,
		})

		vim.treesitter.language.register("bash", "zsh")
	end,
}
