require("snacks").setup({
  dashboard = require("plugins.snacks.dashboard"),
  animate = { enabled = true },
  buffdelete = { enabled = true },
  bigfile = { enabled = true },
  dim = { enable = true },
  explorer = { enabled = true },
  gh = { enabled = true },
  gitbrowse = { enabled = true },
  image = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  lazygit = { enabled = true },
  notifier = { enabled = true, timeout = 3000 },
  picker = { enabled = true },
  -- profiler = { enabled = true },
  quickfile = { enabled = true },
  -- scope = { enabled = true },
  scratch = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  terminal = { enabled = true },
  toggle = { enabled = true },
  util = { enabled = true },
  words = { enabled = true },
  zen = { enabled = true }
})

require("plugins.snacks.keymaps")
