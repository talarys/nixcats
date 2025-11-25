local function copy_highlight(source_group, target_group, attribute)
  attribute = attribute or "bg"
  local source_hl = vim.api.nvim_get_hl(0, { name = source_group })

  if source_hl and source_hl[attribute] then
    vim.api.nvim_set_hl(0, target_group, { [attribute] = source_hl[attribute] })
  end
end

local function get_hlgroup(group)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
  if ok then
    return hl
  else
    return nil
  end
end

local function set_hlgroup(group, attrs)
  vim.api.nvim_set_hl(0, group, attrs)
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local bg = get_hlgroup("Normal").bg
    local bg_alt = get_hlgroup("Visual").bg
    local green = get_hlgroup("String").fg
    local red = get_hlgroup("Error").fg

    set_hlgroup("SnacksPickerBorder", { fg = bg_alt, bg = bg })
    set_hlgroup("SnacksPicker", { bg = bg })
    set_hlgroup("SnacksPickerPreviewBorder", { fg = bg, bg = bg })
    set_hlgroup("SnacksPickerPreview", { bg = bg })
    set_hlgroup("SnacksPickerPreviewTitle", { fg = bg, bg = green })
    set_hlgroup("SnacksPickerBoxBorder", { fg = bg, bg = bg })
    set_hlgroup("SnacksPickerInputBorder", { fg = bg, bg = bg })
    set_hlgroup("SnacksPickerInputSearch", { fg = red, bg = bg })
    set_hlgroup("SnacksPickerListBorder", { fg = bg, bg = bg })
    set_hlgroup("SnacksPickerList", { bg = bg })
    set_hlgroup("SnacksPickerListTitle", { fg = bg, bg = bg })
  end,
})

vim.cmd.colorscheme "catppuccin-mocha"

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      -- ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },
})
