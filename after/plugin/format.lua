require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports-reviser", "gofumpt", "golines" },
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})
