-- VIM GLOBAL OPTIONS --

vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- VIM OPTIONS --

vim.o.updatetime = 50

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.smartcase = true

vim.o.number = true
vim.o.signcolumn = "number"
vim.o.relativenumber = true

vim.o.list = true
vim.o.listchars = "tab:| ,eol:⌅,precedes:…,extends:…,trail:·"

vim.o.scrolloff = 10
vim.o.sidescrolloff = 2
vim.o.wrap = false
vim.o.mouse = "nv"
vim.o.mousemodel = "extend"

vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true

vim.o.incsearch = true
vim.o.inccommand = "split"
vim.o.completeopt = "menuone,noinsert,noselect"

vim.o.background = "dark"
vim.o.guicursor = "i:block"
vim.o.shortmess = "filnxtToOFc"
vim.o.colorcolumn = "80"
vim.o.laststatus = 3
vim.o.errorbells = false
vim.o.hidden = true

vim.o.termguicolors = true

vim.cmd.colorscheme("poser")
