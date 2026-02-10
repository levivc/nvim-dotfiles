return {
--  {
--    "catppuccin/nvim",
--    name = "catppuccin",
--    lazy = false,
--    priority = 1000,
--
--    config = function ()
--      require("catppuccin").setup({
--        flavour = "mocha",
--        color_overrides = {
--          mocha = {
--            surface1 = "#6f759d"
--          },
--        },
--      })
--      vim.cmd.colorscheme("catppuccin")
--    end
--  }
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,

    config = function()
      require("kanagawa").setup({
        colors = {
          palette = {
            sumiInk6 = "#747497",
            peachRed = "#e26165",
            fujiGray = "#8c8b81",
            waveBlue1 = "#2a3e5a",
          }
        },
        overrides = function()
          return {
            Boolean = { bold = false }
          }
        end,
        theme = "wave"
      })
      vim.cmd.colorscheme("kanagawa")
    end
  }
}
