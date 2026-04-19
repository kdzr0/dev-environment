return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				java = { "google-java-format" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				python = { "isort", "black" },
				lua = { "stylua" },
				markdown = { "prettierd" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
