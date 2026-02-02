vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
-- Saving
vim.keymap.set('n', '<C-s>', '<C-\\><C-n><cmd>w<CR>')

-- alt shortcuts
-- Navigate windows
vim.keymap.set({ "t", "i", "n" }, "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set({ "t", "i", "n" }, "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set({ "t", "i", "n" }, "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set({ "t", "i", "n" }, "<A-l>", "<C-\\><C-n><C-w>l")
-- Move windows
vim.keymap.set({ "t", "i", "n" }, "<A-H>", "<C-\\><C-n><C-w>H")
vim.keymap.set({ "t", "i", "n" }, "<A-J>", "<C-\\><C-n><C-w>J")
vim.keymap.set({ "t", "i", "n" }, "<A-K>", "<C-\\><C-n><C-w>K")
vim.keymap.set({ "t", "i", "n" }, "<A-L>", "<C-\\><C-n><C-w>L")
-- Window resizing
vim.keymap.set("n", "<A-->", "3<C-w>-")
vim.keymap.set("n", "<A-=>", "3<C-w>+")
vim.keymap.set("n", "<A-]>", "10<C-w>>")
vim.keymap.set("n", "<A-[>", "10<C-w><")
-- Buffers
vim.keymap.set("n", "<A-.>", "<cmd>bn<CR>")
vim.keymap.set("n", "<A-,>", "<cmd>bp<CR>")

-- leader shortcuts
-- split and close windows
vim.keymap.set("n", "<leader>w", "<C-w>q")
vim.keymap.set("n", "<leader>q", "<cmd>fclose!<CR>")
vim.keymap.set("n", "<leader>s", "<C-w>s")
vim.keymap.set("n", "<leader>v", "<C-w>v")
-- window expand and reset
vim.keymap.set("n", "<leader>-", "<C-w>_")
vim.keymap.set("n", "<leader><Bslash>", "<C-w>|")
vim.keymap.set("n", "<leader>=", "<C-w>=")
-- tabs
vim.keymap.set("n", "<leader>t", "<cmd>tabe<CR>")
vim.keymap.set("n", "<leader>T", "<C-w>T")
vim.keymap.set("n", "<leader>L", "<cmd>tabmove +<CR>")
vim.keymap.set("n", "<leader>H", "<cmd>tabmove -<CR>")
-- execute lua code
vim.keymap.set("n", "<leader>xx", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>xl", "<cmd>.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>") -- can't use <cmd> for some reason
-- quickfix, location list
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>")
vim.keymap.set("n", "<leader>cd", vim.diagnostic.setqflist)
vim.keymap.set("n", "<leader>lo", "<cmd>lopen<CR>")
vim.keymap.set("n", "<leader>lc", "<cmd>lclose<CR>")
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>")
vim.keymap.set("n", "<leader>.", "<cmd>lnext<CR>")
vim.keymap.set("n", "<leader>,", "<cmd>lprev<CR>")
-- netrw
vim.keymap.set("n", "<leader>el", vim.cmd.Explore)
vim.keymap.set("n", "<leader>ew", function() vim.cmd.Explore(".") end)
vim.keymap.set("n", "<leader>en", function() vim.cmd.Explore(vim.fn.stdpath("config")) end)
