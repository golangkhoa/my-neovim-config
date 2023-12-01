require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports-reviser", "gofumpt", "golines" },
		php = { "pretty-php" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		rust = { "rustfmt" },
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})
