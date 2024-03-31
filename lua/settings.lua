local o = vim.o
local wo = vim.wo

wo.number = true
o.clipboard = "unnamedplus"
o.relativenumber = true

o.splitright = true
o.hidden = true
o.lazyredraw = true

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
