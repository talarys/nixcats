local function copy_highlight(source_group, target_group, attribute)
    attribute = attribute or 'bg'
    local source_hl = vim.api.nvim_get_hl(0, { name = source_group })

    if source_hl and source_hl[attribute] then
        vim.api.nvim_set_hl(0, target_group, { [attribute] = source_hl[attribute] })
    end
end

vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
        -- copy_highlight('Normal', 'NormalFloat', 'bg')
        -- copy_highlight('Normal', 'NormalFloat', 'fg')

        -- copy_highlight('Normal', 'FloatBorder', 'bg')
        -- copy_highlight('Normal', 'FloatBorder', 'bg')

        -- copy_highlight('Normal', 'Pmenu', 'bg')
        -- copy_highlight('CursorLine', 'PmenuSel', 'bg')
    end,
})

vim.cmd.colorscheme "catppuccin-mocha"
