vim.keymap.set("n", "j", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true })

vim.keymap.set("n", "k", function()
	return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })

vim.keymap.set({ "n", "v", "i" }, "<c-s>", "<cmd>w ++p<cr>", { desc = "Save file" })

vim.keymap.set("i", "jk", "<esc>", { desc = "Normal Mode" })
vim.keymap.set("i", "jj", "<esc>", { desc = "Normal Mode" })

vim.keymap.set("n", "<leader>qq", "<cmd>quitall!<cr>", { desc = "Quit!" })

vim.keymap.set("n", "<esc>", "<esc>:nohlsearch<cr>", { desc = "escape" })
vim.keymap.set("n", "<leader>A", "ggVG", { desc = "select All" })

vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "vertical split" })
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "horizontal split" })

vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true, desc = "Paste without overwriting register" })

vim.keymap.set("n", "?", function()
	require("flash").jump({ forward = true, wrap = true, multi_window = true })
end, { desc = "Flash Forward" })
