return {
	"folke/snacks.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", { "folke/todo-comments.nvim", opts = {} } },
	lazy = false,
	priority = 1000,
	opts = {
		dashboard = {
			preset = {
				header = [[ 
██╗  ██╗██████╗ ███████╗███████╗██████╗  ██████╗ 
██║ ██╔╝██╔══██╗╚══███╔╝██╔════╝██╔══██╗██╔═══██╗
█████╔╝ ██║  ██║  ███╔╝ █████╗  ██████╔╝██║   ██║
██╔═██╗ ██║  ██║ ███╔╝  ██╔══╝  ██╔══██╗██║   ██║
██║  ██╗██████╔╝███████╗███████╗██║  ██║╚██████╔╝
╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ 
        ]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = { enabled = true },
		git = { enabled = true },
		gitbrowse = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		-- Explorer
		{
			"<leader>ee",
			function()
				Snacks.explorer()
			end,
			desc = "Snacks: File Explorer",
		},
		-- Git
		{
			"<leader>gb",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Snacks: Git Browse",
			mode = { "n", "v" },
		},
		-- Notifications
		{
			"<leader>nh",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Snacks: Notification history",
		},
		{
			"<leader>nd",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Snacks: Dismiss notifications",
		},
		-- Picker
		{
			"<leader>ff",
			function()
				Snacks.picker.smart()
			end,
			desc = "Snacks: Find Files (SMART)",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep()
			end,
			desc = "Snacks: Find string",
		},
		{
			"<leader>fu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Snacks: Visualize undo history",
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Snacks: Find TODOs",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Snacks: Show all keymaps",
		},
		-- LSP
		{
			"<leader>gr",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "LSP: Go to references",
		},
		{
			"<leader>gi",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "LSP: Go to implementations",
		},
		{
			"<leader>ls",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP: Show all symbols",
		},
		{
			"<leader>ld",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "LSP: Show all diagnostics",
		},
		{
			"<leader>lD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "LSP: Show buffer diagnostics",
		},
		-- Words
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Snacks: Next reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Snacks: Previous reference",
			mode = { "n", "t" },
		},
	},
}
