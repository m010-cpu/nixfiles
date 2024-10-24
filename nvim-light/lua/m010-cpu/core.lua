vim.cmd("autocmd!")

local opt = vim.opt
local g = vim.g

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- line numbers --
opt.number = true

-- tabs & indentation --
opt.title = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping --
opt.wrap = false

-- search settings --
opt.ignorecase = true
opt.smartcase = true
opt.iskeyword:append("-")

-- cursor line --
opt.cursorline = true

-- appearance --
opt.termguicolors = true

-- backspace --
opt.backspace = "indent,eol,start"

-- clipboard --
opt.clipboard:append("unnamedplus")

-- split windows --
opt.splitright = true
opt.splitbelow = true

-- disable netrw --
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
