require("snacks").setup({
    animate = { enabled = true },
    bigfile = { enabled = true },
    explorer = { enabled = true },
    gh = { enabled = true },
    gitbrowse = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true, timeout = 3000, },
    picker = { enabled = true },
    profiler = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scratch = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = { enabled = true },
    toggle = { enabled = true },
    util = { enabled = true },
    words = { enabled = true },
})

require("mini.ai").setup()
require("mini.comment").setup()
require("mini.move").setup()
require("mini.operators").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()
require("mini.bracketed").setup()
require("mini.indentscope").setup()
