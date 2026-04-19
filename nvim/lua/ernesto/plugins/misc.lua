return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		"christoomey/vim-tmux-navigator",
	},
	{
		"mg979/vim-visual-multi",
		keys = {
			{ "<leader>mc", "<Plug>(VM-Find-Under)", mode = "n", desc = "vim-visual-multi: Seleção múltipla" },
			{
				"<leader>mc",
				"<Plug>(VM-Find-Under)",
				mode = "v",
				desc = "vim-visual-multi: Seleção múltipla (VISUAL MODE)",
			},
		},
		config = function()
			vim.g.vm_default_mappings = 0
			vim.g.vm_leader = {
				mode = "visual",
			}
			vim.g.vm_maps = {
				["Find Next"] = "j",
				["Find Prev"] = "k",
				["Skip Region"] = "n",
				["Exit"] = "<esc>",
			}
		end,
	},
	{
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
	},
	{
		"aikhe/wrapped.nvim",
		dependencies = { "nvzone/volt" },
		cmd = { "WrappedNvim" },
		opts = {},
		keys = {
			{ "<leader>wr", ":WrappedNvim<CR>", desc = "Wrapped: Open wrapped" },
		},
	},
	{
		"glyccogen/imprint.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Imprint",
		config = function()
			vim.cmd("packadd nvim.tohtml")
			require("imprint").setup({
				output_dir = "/mnt/c/Users/" .. os.getenv("USER") .. "/Downloads/",
				background = "#1e1e2e",
			})
		end,
	},
}
