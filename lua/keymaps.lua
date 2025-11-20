vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.keymap.set("v", "<c-s>", "<esc>:w<cr>", { desc = "Saving File" })
vim.keymap.set("v", "<c-c>", "<esc>", { desc = "Escape" })

vim.keymap.set("v", "<a-j>", ":m '>+1<cr>gv-gv", { desc = "Move Selected Line Down" })
vim.keymap.set("v", "<a-k>", ":m '<lt>-2<CR>gv-gv", { desc = "Move Selected Line Up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent out" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent in" })

vim.keymap.set("v", "<space>", "<Nop>", { desc = "Mapped to Nothing" })

vim.keymap.set("i", "jk", "<esc>", { desc = "Normal Mode" })
vim.keymap.set("i", "jj", "<esc>", { desc = "Normal Mode" })
vim.keymap.set("i", "<c-s>", "<esc>:w ++p<cr>", { desc = "Save file" })
vim.keymap.set("i", "<a-j>", "<esc>:m .+1<cr>==gi", { desc = "Move Line Down" })
vim.keymap.set("i", "<a-k>", "<esc>:m .-2<cr>==gi", { desc = "Move Line Up" })

vim.keymap.set("n", "<c-a-h>", function() require('smart-splits').resize_left() end, { desc = "Resize Left" })
vim.keymap.set("n", "<c-a-j>", function() require('smart-splits').resize_down() end, { desc = "Resize Down" })
vim.keymap.set("n", "<c-a-k>", function() require('smart-splits').resize_up() end, { desc = "Resize Up" })
vim.keymap.set("n", "<c-a-l>", function() require('smart-splits').resize_right() end, { desc = "Resize Right" })

vim.keymap.set("n", "?", function() require('flash').jump({ forward = true, wrap = true, multi_window = true }) end,
    { desc = "Flash Search" })

vim.keymap.set("n", "<c-h>", function() require('smart-splits').move_cursor_left() end, { desc = "Move Cursor Left" })
vim.keymap.set("n", "<c-j>", function() require('smart-splits').move_cursor_down() end, { desc = "Move Cursor Down" })
vim.keymap.set("n", "<c-k>", function() require('smart-splits').move_cursor_up() end, { desc = "Move Cursor Up" })
vim.keymap.set("n", "<c-l>", function() require('smart-splits').move_cursor_right() end, { desc = "Move Cursor Right" })
vim.keymap.set("n", "<c-\\>", function() require('smart-splits').move_cursor_previous() end,
    { desc = "Move Cursor Previous" })
vim.keymap.set("n", "<leader>dd", function()
    local any_diff = false
    for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_win_get_option(w, "diff") then
            any_diff = true
            break
        end
    end

    if any_diff then
        vim.cmd("windo diffoff")
    else
        vim.cmd("windo diffthis")
    end
end, { desc = "Toggle Diff the opened windows" }
)

vim.keymap.set("n", "<c-s>", "<cmd>w ++p<cr>", { desc = "Save the file" })
vim.keymap.set("n", "<a-+>", "<C-a>", { desc = "Increase Number" })
vim.keymap.set("n", "<a-->", "<C-x>", { desc = "Decrease Number" })

vim.keymap.set("n", "<a-j>", "<cmd>m .+1<cr>==", { desc = "Move line Down" })
vim.keymap.set("n", "<a-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

vim.keymap.set("n", "<leader>qq", "<cmd>quitall!<cr>", { desc = "Quit!" })
vim.keymap.set("n", "<leader>qw",
    function()
        local wins = vim.api.nvim_tabpage_list_wins(0)
        if #wins > 1 then
            local ok, err = pcall(vim.cmd, 'close')
            if not ok then
                vim.notify("Cannot close the last window!", vim.log.levels.WARN)
            end
        else
            vim.notify("Cannot close the last window!", vim.log.levels.WARN)
        end
    end,
    { desc = "Close Window!" }
)

vim.keymap.set("n", "<leader><leader>", "<cmd>nohl<cr>", { desc = "no highlight!" })
vim.keymap.set("n", "<esc>", "<esc>:nohlsearch<cr>", { desc = "escape" })
vim.keymap.set("n", "<leader>A", "ggVG", { desc = "select All" })

vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "vertical split" })
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "horizontal split" })

vim.keymap.set("n", "<leader>cn", "<cmd>cnext<cr>", { desc = "quickfix next" })
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<cr>", { desc = "quickfix prev" })
vim.keymap.set("n", "<leader>cq", "<cmd>cclose<cr>", { desc = "quit quickfix" })

vim.keymap.set("n", "<leader>id",
    function()
        local date = "# " .. os.date("%d-%m-%y")
        local row, col = table.unpack(vim.api.nvim_win_get_cursor(0))
        local line = vim.api.nvim_get_current_line()

        -- Insert date at cursor position
        local new_line = line:sub(1, col) .. date .. line:sub(col + 1)
        vim.api.nvim_set_current_line(new_line)

        -- Move cursor to next line
        vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    end, { desc = "Insert Date at cursor position" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Move to center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Moving to center" })
vim.keymap.set("n", "<leader>uC", function() require('stay-centered').toggle() end,
{ desc = "Toggle stay-centered.nvim" })
vim.keymap.set("n", "<leader>ft",
    function()
        vim.ui.input({ prompt = "Enter FileType: " }, function(input)
            local ft = input
            if not input or input == "" then
                ft = vim.bo.filetype
            end
            vim.o.filetype = ft
        end)
    end,
    { desc = "Set Filetype" }
)

vim.keymap.set("n", "<leader>o",
    function()
        local word = vim.fn.expand("<cfile>") -- Gets file-like word under cursor

        if word:match("^https?://") then
            -- Detect OS and choose browser opener
            local open_cmd
            if vim.fn.has("macunix") == 1 then
                open_cmd = "open"
            elseif vim.fn.has("unix") == 1 then
                open_cmd = "xdg-open"
            elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
                open_cmd = "start"
            else
                print("Unsupported OS")
                return
            end

            vim.fn.jobstart({ open_cmd, word }, { detach = true })
        elseif vim.fn.filereadable(word) == 1 or vim.fn.isdirectory(word) == 1 then
            -- It's a file or directory; open in current window
            vim.cmd("edit " .. vim.fn.fnameescape(word))
        else
            print("Not a valid file or URL: " .. word)
        end
    end, { desc = "Open" })


-- Use black hole register for 'x', 'X', 'c', 'C'
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'X', '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'C', '"_C', { noremap = true, silent = true })

-- Visual mode
vim.api.nvim_set_keymap('v', 'x', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'X', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'C', '"_c', { noremap = true, silent = true })

-- In visual mode, paste from the clipboard without overwriting it
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })
