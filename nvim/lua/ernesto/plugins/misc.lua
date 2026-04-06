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
    lazy = false,
    keys = {
      { "<leader>mc", "<Plug>(VM-Find-Under)", mode = "n", desc = "vim-visual-multi: Seleção múltipla" },
      { "<leader>mc", "<Plug>(VM-Find-Under)", mode = "v", desc = "vim-visual-multi: Seleção múltipla (VISUAL MODE)" },
    },
    config = function ()
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
    end
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
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
