--Configuration of the lsp
return {
	{
		--Mason installation
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	}, --Tool installer
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	{
		--Lsp installer
		"williamboman/mason-lspconfig.nvim",
		config = function()
			--for consiciness
			local mason_lspconfig = require("mason-lspconfig")
			--for consiciness
			local mason_tool_installer = require("mason-tool-installer")

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"clangd",
					"bashls",
					"ruff_lsp",
				},
			})
			mason_tool_installer.setup({
				ensure_installed = {
					"shellcheck",
					"pylint",
					"isort",
					"black",
					"beautysh",
					"standardjs",
				},

			})
		end,
	},
	{
		--Setting up linters
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({}) --for python
			lspconfig.lua_ls.setup({}) --for lua
			lspconfig.ruff_lsp.setup({ --for python too (optional)
				init_options = {
					settings = {
						-- Any extra CLI arguments for ruff go here.
						args = {},
					},
				},
			})
			lspconfig.clangd.setup({}) --For C/C++
			lspconfig.bashls.setup({
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh", "zsh", "bash" },
			}) --For bash scripting
		end,
	},
}

