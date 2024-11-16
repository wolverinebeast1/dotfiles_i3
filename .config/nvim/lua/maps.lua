vim.g.mapleader = " " --leader key

local keymap = vim.keymap -- for conciseness

--General things
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save the file using the class ctrl+s" })
keymap.set("n", "ee", "$", { desc = "jump to the end" })
keymap.set("n", "<C-f>", "0", { desc = "jump to the beginning of the line" })
keymap.set("n", "<C-x>", "<cmd>q!<CR>", { desc = "force quit neovim" })
--telescope usage
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

--Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab

--Neotree
keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", { desc = "Open Neotree" })
