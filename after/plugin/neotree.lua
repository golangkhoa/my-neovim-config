require("neo-tree").setup({
	window = {
		width = 30,
	},
	enable_git_status = false,
	name = {
		use_git_status_colors = false,
	},
	default_component_configs = {
		icon = {
			default = "󰈙",
		},
		indent = {
			indent_size = 3,
		},
	},
})
