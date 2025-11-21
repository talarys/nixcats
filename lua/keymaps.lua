vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.keymap.set("n", "j", function()
  return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true })

vim.keymap.set("n", "k", function()
  return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })

vim.keymap.set("n", "<c-s>", "<cmd>w ++p<cr>", { desc = "Save the file" })
vim.keymap.set("v", "<c-s>", "<esc>:w<cr>", { desc = "Saving File" })
vim.keymap.set("i", "<c-s>", "<esc>:w ++p<cr>", { desc = "Save File" })

vim.keymap.set("i", "jk", "<esc>", { desc = "Normal Mode" })
vim.keymap.set("i", "jj", "<esc>", { desc = "Normal Mode" })

vim.keymap.set("n", "?", function() require('flash').jump({ forward = true, wrap = true, multi_window = true }) end,
  { desc = "Flash Forward" })

vim.keymap.set("n", "<c-a-h>", function() require('smart-splits').resize_left() end, { desc = "Resize Left" })
vim.keymap.set("n", "<c-a-j>", function() require('smart-splits').resize_down() end, { desc = "Resize Down" })
vim.keymap.set("n", "<c-a-k>", function() require('smart-splits').resize_up() end, { desc = "Resize Up" })
vim.keymap.set("n", "<c-a-l>", function() require('smart-splits').resize_right() end, { desc = "Resize Right" })
vim.keymap.set("n", "<c-h>", function() require('smart-splits').move_cursor_left() end, { desc = "Move Cursor Left" })
vim.keymap.set("n", "<c-j>", function() require('smart-splits').move_cursor_down() end, { desc = "Move Cursor Down" })
vim.keymap.set("n", "<c-k>", function() require('smart-splits').move_cursor_up() end, { desc = "Move Cursor Up" })
vim.keymap.set("n", "<c-l>", function() require('smart-splits').move_cursor_right() end, { desc = "Move Cursor Right" })
vim.keymap.set("n", "<c-\\>", function() require('smart-splits').move_cursor_previous() end,
  { desc = "Move Cursor Previous" })

vim.keymap.set("n", "<leader>qq", "<cmd>quitall!<cr>", { desc = "Quit!" })

vim.keymap.set("n", "<esc>", "<esc>:nohlsearch<cr>", { desc = "escape" })
vim.keymap.set("n", "<leader>A", "ggVG", { desc = "select All" })

vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "vertical split" })
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "horizontal split" })

-- Use black hole register for 'x', 'X', 'c', 'C'
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'X', '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'C', '"_C', { noremap = true, silent = true })

-- Visual mode
vim.api.nvim_set_keymap('v', 'x', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'X', '"_d', { noremap = true, silen = true })
vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'C', '"_c', { noremap = true, silet = true })

-- In visual mode, paste from the clipboard without overwriting it
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })
