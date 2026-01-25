return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("mini.icons").setup()
      require("mini.statusline").setup({
        use_icons = true
      })
      --require("mini.pairs").setup()
    end
  }
}

