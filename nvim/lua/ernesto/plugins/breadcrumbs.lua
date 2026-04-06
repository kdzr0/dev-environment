return {
	"Bekaboo/dropbar.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dropbar = require("dropbar.api")

		vim.keymap.set("n", "<leader>;", dropbar.pick, { desc = "Dropbar: Pick symbols in breadcrumb" })
		vim.keymap.set("n", "[;", dropbar.goto_context_start, { desc = "Dropbar: Go to start of current context" })
		vim.keymap.set("n", "];", dropbar.select_next_context, { desc = "Dropbar: Select next context" })
	end,
}
