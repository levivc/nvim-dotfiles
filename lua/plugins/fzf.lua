return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "echasnovski/mini.nvim",
  },
  lazy = true,
  keys = {
    {
      "<leader>fd",
      function() require("fzf-lua").files() end,
      desc = "fzf files from cwd" },
    {
      "<leader>fn",
      function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end,
      desc = "fzf nvim config files"
    },
    {
      "<leader>fh",
      function() require("fzf-lua").helptags() end,
      desc = "fzf help tags"
    },
    {
      "<leader>fb",
      function() require("fzf-lua").buffers() end,
      desc = "fzf buffers"
    },
    {
      "<leader>fs",
      function() require("fzf-lua").lsp_document_symbols() end,
      desc = "fzf document symbols"
    },
  }
}
