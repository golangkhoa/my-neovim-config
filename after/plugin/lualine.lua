require("lualine").setup({
	icons_enabled = true,
	theme = "onedark",
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_c = {
			{
				function()
					local filetype = vim.bo.filetype
					local disabled_filetypes = { "neo-tree" }
					if vim.tbl_contains(disabled_filetypes, filetype) then
						return ""
					else
						return vim.fn.expand("%:t")
					end
				end,
			},
		},
	},
})
