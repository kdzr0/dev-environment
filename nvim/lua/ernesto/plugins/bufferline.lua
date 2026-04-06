return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
  version = "*",
  config = function()
    local mocha = require("catppuccin.palettes").get_palette("mocha")

    require("bufferline").setup({
      highlights = require("catppuccin.special.bufferline").get_theme({
        styles = { "italic", "bold" },
        custom = {
          all = {
            fill = { bg = "#1e1e2e" },
          },
          mocha = {
            background = { fg = mocha.text },
          },
        },
      }),
      options = {
        mode = "tabs",

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icons = {
            error = "󰅚 ",
            warning = "󰀪 ",
            info = "󰋽 ",
            hint = "󰌶 ",
          }
          return icons[level] and icons[level] .. count or ""
        end,
      },
    })
  end
}
