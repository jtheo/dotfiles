return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"awk-language-server",
				"bash-language-server",
				"shellcheck",
				"shfmt",
				"tfsec",
				"pylint",
				"prettier",
				"zls",
				"helm-ls",
				"html-lsp",
				"htmlbeautifier",
			},
		},
		{ import = "plugins" },
	},
	{
		"RubixDev/mason-update-all",
		config = true,
	},
}
