local map = vim.keymap.set

map("n", "j", function()
  return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true })

map("n", "k", function()
  return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })

map({ "n", "v", "i" }, "<c-s>", "<cmd>w ++p<cr>", { desc = "Save file" })

map("i", "jk", "<esc>", { desc = "Normal Mode" })
map("i", "jj", "<esc>", { desc = "Normal Mode" })

map("n", "<leader>qq", "<cmd>quitall!<cr>", { desc = "Quit!" })

map("n", "<esc>", "<esc>:nohlsearch<cr>", { desc = "Escape" })
map("n", "<leader>A", "ggVG", { desc = "Select All" })

map("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal split" })

-- Move with hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize with hjkl
map("n", "<C-a-h>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width", silent = true })
map("n", "<C-a-j>", "<cmd>resize -2<CR>", { desc = "Decrease window height", silent = true })
map("n", "<C-a-k>", "<cmd>resize +2<CR>", { desc = "Increase window height", silent = true })
map("n", "<C-a-l>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width", silent = true })

-- Window management
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>wc", "<C-w>c", { desc = "Close current window" })
map("n", "<leader>w=", "<C-w>=", { desc = "Equalize window sizes" })

map("v", "p", '"_dP', { noremap = true, silent = true, desc = "Paste without overwriting register" })

map("n", "?", function()
  require("flash").jump({ forward = true, wrap = true, multi_window = true })
end, { desc = "Flash Forward" })
