return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,

    config = function ()
      require("catppuccin").setup({
        flavour = "mocha",
        highlight_overrides = {
          mocha = function(mocha)
            return { LineNr = { fg = mocha.overlay2 } }
          end,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end
  }
}
