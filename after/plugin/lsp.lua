local on_attach = function(_, bufnr)
	local bufmap = function(keys, func)
		vim.keymap.set("n", keys, func, { buffer = bufnr })
	end

	bufmap("<leader>r", vim.lsp.buf.rename)
	bufmap("<leader>a", vim.lsp.buf.code_action)

	bufmap("gd", vim.lsp.buf.definition)
	bufmap("gD", vim.lsp.buf.declaration)
	bufmap("gI", vim.lsp.buf.implementation)
	bufmap("<leader>D", vim.lsp.buf.type_definition)

	bufmap("gr", require("telescope.builtin").lsp_references)
	bufmap("<leader>s", require("telescope.builtin").lsp_document_symbols)
	bufmap("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols)

	bufmap("K", vim.lsp.buf.hover)

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("mason").setup()
require("mason-lspconfig").setup_handlers({
	["lua_ls"] = function()
		require("neodev").setup()
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		})
	end,

	["gopls"] = function()
		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			single_file_support = true,
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})
	end,

	["dockerls"] = function()
		lspconfig.dockerls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "docker-langserver", "--stdio" },
			filetypes = { "dockerfile" },
			root_dir = util.root_pattern("Dockerfile"),
			single_file_support = true,
		})
	end,

	["elixirls"] = function()
		lspconfig.elixirls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "/home/dang-khoa/Downloads/elixir-ls/language_server.sh" },
			filetypes = { "elixir", "eelixir", "heex", "surface" },
			single_file_support = true,
		})
	end,

	["intelephense"] = function()
		lspconfig.intelephense.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "intelephense", "--stdio" },
			filetypes = { "php" },
			single_file_support = true,
		})
	end,

	["tsserver"] = function()
		lspconfig.tsserver.setup({
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"javascript",
				"typescript",
			},
			root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
			single_file_support = true,
			init_options = {
				preferences = {
					disableSuggestions = true,
				},
			},
		})
	end,

	["svelte"] = function()
		lspconfig.svelte.setup({
			cmd = { "svelteserver", "--stdio" },
			filetypes = { "svelte" },
			root_dir = util.root_pattern("package.json", ".git"),
		})
	end,

	["html"] = function()
		lspconfig.html.setup({
			capabilities = capabilities,
			cmd = { "vscode-html-language-server", "--stdio" },
			filetypes = { "html", "svelte" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = {
					css = true,
					javascript = true,
				},
				provideFormatter = true,
			},
			single_file_support = true,
		})
	end,

	["rust_analyzer"] = function()
		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "rust-analyzer" },
			filetypes = { "rust" },
			root_dir = util.root_pattern("Cargo.toml"),
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		})
	end,
})
