vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>e", vim.cmd.Explore)
vim.keymap.set("n", "<leader>q", "<C-w>q")
vim.keymap.set("n", "<leader>s", "<C-w>s")
vim.keymap.set("n", "<leader>v", "<C-w>v")
vim.keymap.set("n", "<A-.>", ":bn<CR>")
vim.keymap.set("n", "<A-,>", ":bp<CR>")

-- Source file, selection and line shortcuts
vim.keymap.set("n", "<space><space>x", ":source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Tab window settings
vim.keymap.set("n", "<leader>t", ":tabe<CR>")
vim.keymap.set("n", "<leader>l", "gt")
vim.keymap.set("n", "<leader>h", "gT")
vim.keymap.set("n", "<leader>L", ":tabmove +<CR>")
vim.keymap.set("n", "<leader>H", ":tabmove -<CR>")

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
-- Saving
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<C-\\><C-n><C-w>:w<CR>')

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
vim.keymap.set("n", "<A-->", "5<C-w>-")
vim.keymap.set("n", "<A-=>", "5<C-w>+")
vim.keymap.set("n", "<A-]>", "5<C-w>>")
vim.keymap.set("n", "<A-[>", "5<C-w><")
vim.keymap.set("n", "<leader>-", "<C-w>_")
vim.keymap.set("n", "<leader><Bslash>", "<C-w>|")
vim.keymap.set("n", "<leader>=", "<C-w>=")

vim.keymap.set("n", "<leader>m", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>M", vim.diagnostic.setqflist)
