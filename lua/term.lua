local command = nil
local term_buf = nil
local term_chan = nil
local last_cwd = nil

local function update_cwd()
  local cwd = vim.fn.getcwd()
  if last_cwd ~= cwd then
    if term_chan then
      vim.api.nvim_chan_send(term_chan, "cd " .. vim.fn.shellescape(cwd) .. "\n")
    end
    last_cwd = cwd
  end
end

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
   if vim.bo.buftype == "terminal" then
      update_cwd()
      vim.cmd.startinsert()
    end
  end
})

local function set_command()
  command = vim.fn.input("Command: ", "", "file")
end

local function split_window()
  vim.cmd("botright 100vsplit")
end

local function show_terminal()
  local is_new = false

  -- Check if terminal buffer still exists
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    -- Find if terminal is visible in a window
    local win = vim.fn.bufwinid(term_buf)
    if win == -1 then
      -- Buffer exists but not visible, open it
      split_window()
      vim.api.nvim_win_set_buf(0, term_buf)
    else
      -- Already visible, focus it
      vim.api.nvim_set_current_win(win)
    end

    update_cwd()
  else
    -- Create new terminal
    split_window()
    vim.cmd.term()
    term_buf = vim.api.nvim_get_current_buf()
    term_chan = vim.b.terminal_job_id
    last_cwd = vim.fn.getcwd()
    is_new = true
  end

  vim.cmd.startinsert()
  return is_new
end

local function send_to_term()
  if not term_chan then return end
  vim.api.nvim_chan_send(term_chan, "clear\n")
  vim.api.nvim_chan_send(term_chan, command .. "\n")
end

vim.keymap.set("n", "<leader>xj", function()
  if not command then set_command() end
  local is_new = show_terminal()
  if is_new then
    vim.defer_fn(send_to_term, 500)
  else
    send_to_term()
  end
  vim.cmd.stopinsert()
  vim.cmd.wincmd("p")
end)

vim.keymap.set("n", "<leader>xc", set_command)
vim.keymap.set("n", "<C-j>", show_terminal)
vim.keymap.set("t", "<C-j>", function() vim.cmd.wincmd("q") end)
