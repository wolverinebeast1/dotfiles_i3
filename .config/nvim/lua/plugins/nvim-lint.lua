return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			cpp = { "cpplint" },
			python = { "pylint" },
			javascript = { "standardjs" },
			css = { "ast-grep" },
			bash = { "shellcheck" },
		}
	end,
}
