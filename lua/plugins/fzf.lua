return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "echasnovski/mini.nvim",
  },
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
    {
      "<leader>fg",
      function() require("fzf-lua").live_grep() end,
      desc = "fzf live grep"
    },
    {
      "<leader>fz",
      function() require("fzf-lua").live_grep({ cwd = "~/.local/prog/zig/zig/lib/" }) end,
      desc = "fzf live grep zig lib"
    }
  },
  config = function()
    require("fzf-lua").setup({
      files = {
        fd_opts = "--exclude .zig-cache"
      }
    })
  end
}
