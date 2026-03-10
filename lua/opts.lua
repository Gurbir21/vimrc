local opt = vim.opt

opt.guicursor = ""

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.wrap = false

opt.number = true
opt.relativenumber = true

opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undo-dir"
opt.swapfile = false
opt.backup = false

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.signcolumn = "yes"
opt.scrolloff = 8

opt.colorcolumn = '80'

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25



