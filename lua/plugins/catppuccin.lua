return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,

    config = function ()
      require("catppuccin").setup({
        flavour = "mocha",
        color_overrides = {
          mocha = {
            surface1 = "#6f759d"
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end
  }
}
