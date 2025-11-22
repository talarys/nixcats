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

vim.keymap.set("n", "<leader>qq", "<cmd>quitall!<cr>", { desc = "Quit!" })

vim.keymap.set("n", "<esc>", "<esc>:nohlsearch<cr>", { desc = "escape" })
vim.keymap.set("n", "<leader>A", "ggVG", { desc = "select All" })

vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "vertical split" })
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "horizontal split" })

vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true, desc = "Paste without overwriting register" })

vim.keymap.set("n", "?", function() require('flash').jump({ forward = true, wrap = true, multi_window = true }) end,
  { desc = "Flash Forward" })

-- Smart splits
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

-- LSP Keymaps
vim.keymap.set("n", "<leader>lO", function() require('otter').activate() end, { desc = "Force Otter" })

vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous Diagnostic" })
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Jump Prev Diagnostic" })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next Diagnostic" })
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Jump Next Diagnostic" })
vim.keymap.set("n", "<C-s-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature Help" })
vim.keymap.set("n", "<leader>l.", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "Line Diagnostics" })
vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Code Action" })
vim.keymap.set("n", "<leader>lD", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", { desc = "Definitions list" })
vim.keymap.set("n", "<leader>lf", function() require('conform').format() end, { desc = "Format file" })
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Outline" })
vim.keymap.set("n", "<leader>lq", "<cmd>LspStop<Enter>", { desc = "Stop LSP" })
vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<Enter>", { desc = "Restart LSP" })
vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename ++project<cr>", { desc = "Rename" })
vim.keymap.set("n", "<leader>ls", "<cmd>lua Snacks.picker.lsp_symbols()<cr>", { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>lS", "<cmd>LspStart<Enter>", { desc = "Start LSP" })
vim.keymap.set("n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { desc = "Definitions" })
vim.keymap.set("n", "gpd", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek Definition" })
vim.keymap.set("n", "gpt", "<cmd>Lspsaga peek_type_definition<cr>", { desc = "Peek Type Definition" })
vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", { desc = "Type Definitions" })
vim.keymap.set("n", "K", function() vim.cmd("Lspsaga hover_doc") end, { desc = "Hover Doc" })
vim.keymap.set("v", "<leader>lf", function() require('conform').format() end, { desc = "Format File" })
vim.keymap.set("x", "<leader>lf", function() require('conform').format() end, { desc = "Format File" })


-- Top Pickers & Explorer
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })

-- find
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
  { desc = "Find Config Fie" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })

-- git
vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })

-- gh
vim.keymap.set("n", "<leader>gi", function() Snacks.picker.gh_issue() end, { desc = "GitHub Issues (open)" })
vim.keymap.set("n", "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end,
  { desc = "GitHub Issues (all)" })
vim.keymap.set("n", "<leader>gp", function() Snacks.picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" })
vim.keymap.set("n", "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,
  { desc = "GitHub Pull Requests (all)" })

-- Grep
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })

-- search
vim.keymap.set("n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
vim.keymap.set("n", '<leader>s/', function() Snacks.picker.search_history() end, { desc = "Search History" })
vim.keymap.set("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sp", function() Snacks.picker.lazy() end, { desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
vim.keymap.set("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
vim.keymap.set("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })

-- LSP
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "References" })
vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "gai", function() Snacks.picker.lsp_incoming_calls() end, { desc = "C[a]lls Incoming" })
vim.keymap.set("n", "gao", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "C[a]lls Outgoing" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,
  { desc = "LSP Workspace Symbols" })

-- Other
vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>Z", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })
vim.keymap.set("n", "<leader>.", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
vim.keymap.set("n", "<leader>n", function() Snacks.notifier.show_history() end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
vim.keymap.set("n", "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss All Notifications" })
vim.keymap.set("n", "<c-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<c-_>", function() Snacks.terminal() end, { desc = "which_key_ignore" })
vim.keymap.set("n", "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
vim.keymap.set("n", "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })

Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
  "<leader>uc")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.inlay_hints():map("<leader>uh")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.dim():map("<leader>uD")
