return {
	enable = true,
	layout = "custom",
	layouts = {
		custom = {
			layout = {
				box = "vertical",
				backdrop = false,
				row = -1,
				width = 0,
				height = 0.4,
				border = "none",
				title = "{title} {live} {flags}",
				title_pos = "left",
				{
					box = "horizontal",
					{ win = "list", border = "rounded" },
				},
				{ win = "input", height = 1, border = "none" },
			},
		},
		custom_grep = {
			layout = {
				box = "vertical",
				backdrop = false,
				row = -1,
				width = 0,
				height = 0.8,
				border = "none",
				title = "{title} {live} {flags}",
				title_pos = "left",
				{ win = "preview", title = "{preview}", height = 0.5, border = "rounded" },
				{
					box = "horizontal",
					{ win = "list", border = "rounded" },
				},
				{ win = "input", height = 1, border = "none" },
			},
		},
	},
	sources = {
		grep = {
			layout = "custom_grep",
		},
	},
}
