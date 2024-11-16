return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	name = "tokyonight",
	opts = {},
	config = function()
		vim.cmd.colorscheme("tokyonight")
	end,
}
