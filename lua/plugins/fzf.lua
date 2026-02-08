return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "echasnovski/mini.nvim",
  },
  lazy = true,
  keys = {
    {
      "<leader>fj",
      function() require("fzf-lua").files() end,
      desc = "fzf files from cwd"
    },
    {
      "<leader>fl",
      function() require('fzf-lua').files({ cwd = vim.fn.expand('%:p:h') }) end,
      desc = "fzf files from current file directory"
    },
    {
      "<leader>fn",
      function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end,
      desc = "fzf nvim config files"
    },
    {
      "<leader>fm",
      function() require("fzf-lua").files({ cwd = "~/.config" }) end,
      desc = "fzf ~/config files"
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
