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
	filesystem = {
		filtered_items = {
			visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
			hide_dotfiles = false,
			hide_gitignored = true,
		},
	},
})
