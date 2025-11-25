require("which-key").setup {
  preset = "helix",
  icons = { mappings = false },
  spec = {
    mode = { "n", "x" },
    { "<leader><tab>", group = "tabs" },
    { "<leader>b",     group = "buffers" },
    { "<leader>f",     group = "find" },
    { "<leader>g",     group = "git" },
    { "<leader>l",     group = "lsp" },
    { "<leader>q",     group = "quit" },
    { "<leader>s",     group = "search" },
    { "<leader>u",     group = "toggles" },
    { "<leader>w",     group = "windows" },
    { "<leader>.",     group = "scratch" },
  }
}
