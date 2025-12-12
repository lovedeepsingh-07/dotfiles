local M = {}

M.setup = function()
	require("snacks").setup({
		picker = require("snacks-config.picker"),
		lazygit = {
			enable = true,
		},
	})
end

return M
