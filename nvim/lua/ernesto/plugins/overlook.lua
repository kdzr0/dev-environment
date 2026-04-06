return {
	"WilliamHsieh/overlook.nvim",
	opts = {},
	keys = {
		{
			"<leader>pd",
			function()
				require("overlook.api").peek_definition()
			end,
			desc = "Overlook: Peek definition",
		},
		{
			"<leader>ph",
			function()
				require("overlook.api").open_in_split()
			end,
			desc = "Overlook: Promote pop-up to horizontal split",
		},
		{
			"<leader>pv",
			function()
				require("overlook.api").open_in_vsplit()
			end,
			desc = "Overlook: Promote pop-up to vertical split",
		},
		{
			"<leader>pt",
			function()
				require("overlook.api").open_in_tab()
			end,
			desc = "Overlook: Promote pop-up to new tab",
		},
		{
			"<leader>pc",
			function()
				require("overlook.api").close_all()
			end,
			desc = "Overlook: Close all pop-ups",
		},
	},
}
