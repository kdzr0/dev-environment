return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "classic",
      transparent_bg = true,
    })

    local severity = vim.diagnostic.severity

    vim.diagnostic.config({
      virtual_text = false,
      signs = {
        text = {
          [severity.ERROR] = "󰅚 ",
          [severity.WARN] = "󰀪 ",
          [severity.HINT] = "󰌶 ",
          [severity.INFO] = "󰋽 ",
        },
      },
    })
  end
}
