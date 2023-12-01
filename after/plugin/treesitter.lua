require("nvim-treesitter.configs").setup({
	ensure_installed = { "vim", "vimdoc", "lua", "cpp", "go" },
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = false },
})
