local km = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Use <Esc> to exit terminal mode
km.set('t', '<Esc>', '<C-\\><C-n>')
-- Saving
km.set({ 'n', 'i' }, '<C-s>', '<C-\\><C-n><cmd>w<CR>')

-- alt shortcuts
-- Navigate windows
km.set({ "t", "i", "n" }, "<A-h>", "<C-\\><C-n><C-w>h")
km.set({ "t", "i", "n" }, "<A-j>", "<C-\\><C-n><C-w>j")
km.set({ "t", "i", "n" }, "<A-k>", "<C-\\><C-n><C-w>k")
km.set({ "t", "i", "n" }, "<A-l>", "<C-\\><C-n><C-w>l")
-- Move windows
km.set({ "t", "i", "n" }, "<A-H>", "<C-\\><C-n><C-w>H")
km.set({ "t", "i", "n" }, "<A-J>", "<C-\\><C-n><C-w>J")
km.set({ "t", "i", "n" }, "<A-K>", "<C-\\><C-n><C-w>K")
km.set({ "t", "i", "n" }, "<A-L>", "<C-\\><C-n><C-w>L")
-- Window resizing
km.set("n", "<A-->", "3<C-w>-")
km.set("n", "<A-=>", "3<C-w>+")
km.set("n", "<A-]>", "10<C-w>>")
km.set("n", "<A-[>", "10<C-w><")
-- Buffers
km.set("n", "<A-.>", "<cmd>bn<CR>")
km.set("n", "<A-,>", "<cmd>bp<CR>")

-- leader shortcuts
-- split and close windows
km.set("n", "<leader>w", "<C-w>q")
km.set("n", "<leader>q", "<cmd>fclose!<CR>")
km.set("n", "<leader>s", "<C-w>s")
km.set("n", "<leader>v", "<C-w>v")
-- window expand and reset
km.set("n", "<leader>-", "<C-w>_")
km.set("n", "<leader><Bslash>", "<C-w>|")
km.set("n", "<leader>=", "<C-w>=")
-- tabs
km.set("n", "<leader>t", "<cmd>tabe<CR>")
km.set("n", "<leader>T", "<C-w>T")
km.set("n", "<leader>L", "<cmd>tabmove +<CR>")
km.set("n", "<leader>H", "<cmd>tabmove -<CR>")
-- execute lua code
km.set("n", "<leader>xx", "<cmd>source %<CR>")
km.set("n", "<leader>xl", "<cmd>.lua<CR>")
km.set("v", "<leader>x", ":lua<CR>") -- can't use <cmd> for some reason
-- quickfix, location list
km.set("n", "<leader>co", "<cmd>copen<CR>")
km.set("n", "<leader>cc", "<cmd>cclose<CR>")
km.set("n", "<leader>cd", vim.diagnostic.setqflist)
km.set("n", "<leader>lo", "<cmd>lopen<CR>")
km.set("n", "<leader>lc", "<cmd>lclose<CR>")
km.set("n", "<leader>ld", vim.diagnostic.setloclist)
km.set("n", "<leader>j", "<cmd>cnext<CR>")
km.set("n", "<leader>k", "<cmd>cprev<CR>")
km.set("n", "<leader>.", "<cmd>lnext<CR>")
km.set("n", "<leader>,", "<cmd>lprev<CR>")
-- netrw
km.set("n", "<leader>el", vim.cmd.Explore)
km.set("n", "<leader>ew", function() vim.cmd.Explore(".") end)
--terminal
km.set("n", "<C-j>", function()
  vim.cmd("botright 15split")
  vim.cmd.term()
  vim.cmd.startinsert()
end)

km.set("t", "<C-j>", function() vim.cmd.wincmd("q") end)
