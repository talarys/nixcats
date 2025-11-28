vim.lsp.enable({
  "basedpyright",
  "bash_ls",
  "biome",
  "clangd",
  "cssls",
  "fish_lsp",
  "gleam",
  "gopls",
  "hls",
  "jsonls",
  "just",
  "lua_ls",
  "nixd",
  "nushell",
  "ocamllsp",
  "rust_analyzer",
  "tailwindcss",
  "zls",
})



local map = vim.keymap.set

map("n", "<leader>lO", function() require("otter").activate() end, { desc = "Force Otter" })

-- LSP Keymaps
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous Diagnostic" })
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Jump Prev Diagnostic" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next Diagnostic" })
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Jump Next Diagnostic" })
map("n", "<C-s-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature Help" })
map("n", "<leader>l.", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "Line Diagnostics" })
map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Code Action" })
map("n", "<leader>lD", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", { desc = "Definitions list" })
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
map("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Outline" })
map("n", "<leader>lq", "<cmd>LspStop<Enter>", { desc = "Stop LSP" })
map("n", "<leader>lR", "<cmd>LspRestart<Enter>", { desc = "Restart LSP" })
map("n", "<leader>lr", "<cmd>Lspsaga rename ++project<cr>", { desc = "Rename" })
map("n", "<leader>ls", "<cmd>lua Snacks.picker.lsp_symbols()<cr>", { desc = "LSP Symbols" })
map("n", "<leader>lS", "<cmd>LspStart<Enter>", { desc = "Start LSP" })
map("n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
map("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { desc = "Definitions" })
map("n", "gpd", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek Definition" })
map("n", "gpt", "<cmd>Lspsaga peek_type_definition<cr>", { desc = "Peek Type Definition" })
map("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", { desc = "Type Definitions" })
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover Doc" })
map({ "n", "v", "x" }, "<leader>lf", function() require("conform").format() end, { desc = "Format File" })


require("lspsaga").setup({
  symbol_in_winbar = { enable = true, show_file = true },
  lightbulb = { sign = false }
})
require("lazydev").setup()
