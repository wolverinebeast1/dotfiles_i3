--NOTE: Some options
vim.cmd("set number")
--Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
--Enable system clipboard support
vim.opt.clipboard:append("unnamedplus")
--Sets the cursor to beam shape in all modes
-- vim.opt.guicursor = { "a:ver25" }
-- Shows the relative number line
vim.cmd("set relativenumber")
