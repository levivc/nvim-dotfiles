return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "echasnovski/mini.nvim",
  },
  lazy = true,
  keys = {
    {
      "<leader>fd",
      function() require("fzf-lua").global() end,
      desc = "fzf files" },
    {
      "<leader>fn",
      function() require("fzf-lua").global({ cwd = vim.fn.stdpath("config") }) end,
      desc = "fzf nvim config files"
    },
    {
      "<leader>fh",
      function() require("fzf-lua").helptags() end,
      desc = "fzf help tags"
    }
  }
}
