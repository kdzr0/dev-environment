return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Gitsigns: Next hunk" })
				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Gitsigns: Previous hunk" })
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Gitsigns: Stage hunk" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Gitsigns: Reset hunk" })
				map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Gitsigns: Preview hunk inline" })
				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Gitsigns: Blame inline" })
				map("n", "<leader>hd", gitsigns.diffthis, { desc = "Gitsigns: Diff current buffer with staged" })
				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end, { desc = "Gitsigns: Diff current buffer with previous commit" })
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Gitsigns: Toggle blame inline" })
				map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Gitsigns: Select hunk (TEXT OBJECTS)" })
			end,
		})
	end,
}
