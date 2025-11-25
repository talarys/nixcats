local mocha = require("catppuccin.palettes").get_palette "mocha"
local latte = require("catppuccin.palettes").get_palette "latte"

require("bufferline").setup({
  options = {
    close_command = function(n) Snacks.bufdelete(n) end,
    right_mouse_command = function(n) Snacks.bufdelete(n) end,
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    offsets = {
      {
        filetype = "snacks_layout_box",
      },
    },
  },
  highlights = require("catppuccin.special.bufferline").get_theme {
    styles = { "bold" },
  },
})

local map = vim.keymap.set

map("n", "<leader>bp", "<cmd>:BufferLinePick<cr>", { desc = "Buffer Line Pick" })
map("n", "<leader>bq", "<cmd>:bp | bd #<cr>", { desc = "Buffer close" })
map("n", "<leader>bP", "<cmd>BufferLineTogglePin<cr>", { desc = "Buffer Pin" })
map("n", "<leader>bd", "<cmd>BufferLineSortByDirectory<cr>", { desc = "Buffer Sort by dir" })
map("n", "<leader>be", "<cmd>BufferLineSortByExtension<cr>", { desc = "Buffer Sort by ext" })
map("n", "<leader>bt", "<cmd>BufferLineSortByTabs<cr>", { desc = "Buffer Sort by Tabs" })
map("n", "<leader>bL", "<cmd>BufferLineCloseRight<cr>", { desc = "Buffer close all to right" })
map("n", "<leader>bH", "<cmd>BufferLineCloseLeft<cr>", { desc = "Buffer close all to left" })
map("n", "<leader>bc", "<cmd>BufferLineCloseOther<cr>", { desc = "Buffer close all except the current buffer" })
map("n", "<a-s-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to left" })
map("n", "<a-s-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to right" })
map("n", "<s-h>", ":BufferLineCyclePrev<cr>", { desc = "Buffer Previous", silent = true })
map("n", "<s-l>", ":BufferLineCycleNext<cr>", { desc = "Buffer Next", silent = true })
map("n", "<leader><tab>j", "<cmd>tabn<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>k", "<cmd>tabp<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>l", "<cmd>tabn<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>h", "<cmd>tabp<cr>", { desc = "Previous Tab" })
map("n", "<leader>qt", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
