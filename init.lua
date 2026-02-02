require("remap")
require("term")
require("config.lazy")

vim.o.termguicolors = true

vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.netrw_preview = 1

vim.o.tabstop = 8
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true
vim.o.scrolloff = 10

vim.o.list = true
vim.o.confirm = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.updatetime = 250

vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:ver25-blinkon500-blinkoff500-TermCursor"

vim.diagnostic.config({
  underline = false,
  virtual_text = true,
  signs = false,
  severity_sort = true
})

-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('levivc.init.lua', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })

vim.cmd('packadd! nohlsearch')
