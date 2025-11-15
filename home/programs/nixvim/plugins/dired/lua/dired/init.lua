local config = require("dired.config")
local dired = require("dired.dired")

local M = {}

M.open = dired.open_dir
M.quit = dired.quit_buf
M.enter = dired.enter_dir
M.goback = dired.go_back
M.goup = dired.go_up
M.init = dired.init_dired
M.rename = dired.rename_file
M.create = dired.create_file
M.delete = dired.delete_file
M.delete_range = dired.delete_file_range
M.duplicate = dired.duplicate_file
M.clip = dired.clip_file
M.clip_range = dired.clip_file_range
M.clip_marked = dired.clip_marked
M.paste = dired.paste_file
M.mark = dired.mark_file
M.mark_range = dired.mark_file_range
M.delete_marked = dired.delete_marked
M.cmd = dired.shell_cmd
M.cmd_curr_dir = dired.shell_cmd_curr_dir
M.cmd_marked = dired.shell_cmd_marked
M.toggle_hidden_files = dired.toggle_hidden_files
M.toggle_sort_order = dired.toggle_sort_order
M.toggle_show_icons = dired.toggle_show_icons
M.toggle_colors = dired.toggle_colors
M.toggle_hide_details = dired.toggle_hide_details
M.preview_highlight_current_line = dired.preview_highlight_current_line

function M.setup(opts)
	-- apply user config
	local errs = config.update(opts)
	require("dired.highlight").setup()
	if #errs == 1 then
		vim.api.nvim_err_writeln("dired.setup: " .. errs[1])
	elseif #errs > 1 then
		vim.api.nvim_err_writeln("dired.setup:")
		for _, err in ipairs(errs) do
			vim.api.nvim_err_writeln("    " .. err)
		end
	end

	if vim.g.dired_loaded then
		return
	end

	if config.get("show_colors") == nil then
		-- default for show-hidden is true
		vim.g.dired_show_colors = true
	else
		vim.g.dired_show_colors = config.get("show_colors")
	end

	-- global variable for show_hidden
	if config.get("show_hidden") == nil then
		-- default for show-hidden is true
		vim.g.dired_show_hidden = true
	else
		vim.g.dired_show_hidden = config.get("show_hidden")
	end

	-- global variable for show_icons
	if config.get("show_icons") == nil then
		-- default for show_icons is false
		vim.g.dired_show_icons = false
	else
		vim.g.dired_show_icons = config.get("show_icons")
	end

	-- global variable for hide_details
	if config.get("hide_details") == nil then
		-- default for show-hidden is true
		vim.g.dired_hide_details = true
	else
		vim.g.dired_hide_details = config.get("hide_details")
	end

	if config.get("show_dot_dirs") == nil then
		-- default for show-hidden is true
		vim.g.dired_show_dot_dirs = true
	else
		vim.g.dired_show_dot_dirs = config.get("show_dot_dirs")
	end

	-- global variable for sort_order
	if config.get("sort_order") == nil then
		-- default for sort_order is sort_by_name
		vim.g.dired_sort_order = true
	else
		vim.g.dired_sort_order = config.get("sort_order")
	end

	vim.cmd([[command! -nargs=? -complete=dir Dired lua require'dired'.open(<q-args>)]])
	vim.cmd([[command! -nargs=? -complete=file DiredRename lua require'dired'.rename(<q-args>)]])
	vim.cmd([[command! -nargs=? -complete=file DiredDelete lua require'dired'.delete(<q-args>)]])
	vim.cmd([[command! -nargs=? -complete=file DiredMark lua require'dired'.mark(<q-args>)]])
	vim.cmd([[command! DiredDeleteRange lua require'dired'.delete_range()]])
	vim.cmd([[command! DiredDeleteMarked lua require'dired'.delete_marked()]])
	vim.cmd([[command! DiredMarkRange lua require'dired'.mark_range()]])
	vim.cmd([[command! DiredGoBack lua require'dired'.goback()]])
	vim.cmd([[command! DiredGoUp lua require'dired'.goup()]])
	vim.cmd([[command! DiredCopy lua require'dired'.clip("copy")]])
	vim.cmd([[command! DiredCopyRange lua require'dired'.clip_range("copy")]])
	vim.cmd([[command! DiredCopyMarked lua require'dired'.clip_marked("copy")]])
	vim.cmd([[command! DiredMove lua require'dired'.clip("move")]])
	vim.cmd([[command! DiredMoveRange lua require'dired'.clip_range("move")]])
	vim.cmd([[command! DiredMoveMarked lua require'dired'.clip_marked("move")]])
	vim.cmd([[command! DiredPaste lua require'dired'.paste()]])
	vim.cmd([[command! DiredEnter lua require'dired'.enter()]])
	vim.cmd([[command! DiredCreate lua require'dired'.create()]])
	vim.cmd([[command! DiredDuplicate lua require'dired'.duplicate()]])
	vim.cmd([[command! DiredToggleHidden lua require'dired'.toggle_hidden_files()]])
	vim.cmd([[command! -nargs=? -complete=shellcmd DiredShellCmd lua require'dired'.cmd(<q-args>)]])
	vim.cmd([[command! -nargs=? -complete=shellcmd DiredShellCmdMarked lua require'dired'.cmd_marked(<q-args>)]])
	vim.cmd([[command! -nargs=? -complete=shellcmd DiredShellCmdCurrDir lua require'dired'.cmd_curr_dir(<q-args>)]])
	vim.cmd([[command! DiredToggleSortOrder lua require'dired'.toggle_sort_order()]])
	vim.cmd([[command! DiredToggleColors lua require'dired'.toggle_colors()]])
	vim.cmd([[command! DiredToggleIcons lua require'dired'.toggle_show_icons()]])
	vim.cmd([[command! DiredToggleHideDetails lua require'dired'.toggle_hide_details()]])
	vim.cmd([[command! DiredQuit lua require'dired'.quit()]])

	-- setup keybinds
	local map = vim.api.nvim_set_keymap

	map("n", "-", ":DiredGoBack<CR>", { silent = true, noremap = true })

	-- FileType-local keymaps
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "dired",
		callback = function()
			local buf_map = function(mode, lhs, rhs)
				vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, { silent = true, noremap = true })
			end

			local kb = config.get("keybinds")
			if kb == nil then
				return
			end

			buf_map("n", kb.dired_enter, ":DiredEnter<CR>")
			buf_map("n", kb.dired_back, ":DiredGoBack<CR>")
			buf_map("n", kb.dired_up, ":DiredGoUp<CR>")
			buf_map("n", kb.dired_rename, ":DiredRename<CR>")
			buf_map("n", kb.dired_create, ":DiredCreate<CR>")
			buf_map("n", kb.dired_delete, ":DiredDelete<CR>")
			buf_map("v", kb.dired_delete_range, ":<C-u>DiredDeleteRange<CR>")
			buf_map("n", kb.dired_duplicate, ":DiredDuplicate<CR>")
			buf_map("n", kb.dired_copy, ":DiredCopy<CR>")
			buf_map("v", kb.dired_copy_range, ":<C-u>DiredCopyRange<CR>")
			buf_map("n", kb.dired_copy_marked, ":DiredCopyMarked<CR>")
			buf_map("n", kb.dired_move, ":DiredMove<CR>")
			buf_map("v", kb.dired_move_range, ":<C-u>DiredMoveRange<CR>")
			buf_map("n", kb.dired_move_marked, ":DiredMoveMarked<CR>")
			buf_map("n", kb.dired_paste, ":DiredPaste<CR>")
			buf_map("n", kb.dired_mark, ":DiredMark<CR>")
			buf_map("v", kb.dired_mark_range, ":<C-u>DiredMarkRange<CR>")
			buf_map("n", kb.dired_delete_marked, ":DiredDeleteMarked<CR>")
			buf_map("n", kb.dired_shell_cmd, ":DiredShellCmd<CR>")
			buf_map("n", kb.dired_shell_cmd_curr_dir, ":DiredShellCmdCurrDir<CR>")
			buf_map("n", kb.dired_shell_cmd_marked, ":DiredShellCmdMarked<CR>")
			buf_map("n", kb.dired_toggle_hidden, ":DiredToggleHidden<CR>")
			buf_map("n", kb.dired_toggle_sort_order, ":DiredToggleSortOrder<CR>")
			buf_map("n", kb.dired_toggle_colors, ":DiredToggleColors<CR>")
			buf_map("n", kb.dired_toggle_icons, ":DiredToggleIcons<CR>")
			buf_map("n", kb.dired_toggle_hide_details, ":DiredToggleHideDetails<CR>")
			buf_map("n", kb.dired_quit, ":DiredQuit<CR>")

			if config.get("enable_click_preview") then
				buf_map("n", "<LeftMouse>", "<LeftMouse>:lua require('dired').preview_highlight_current_line()<CR>")
			end

			if config.get("enable_double_click_open") then
				buf_map("n", "<2-LeftMouse>", "<LeftMouse>:DiredEnter<CR>")
			end
		end,
	})

	local dired_group = vim.api.nvim_create_augroup("dired", { clear = true })

	-- open dired when opening a directory
	vim.api.nvim_create_autocmd("BufEnter", {
		pattern = "*",
		command = "if isdirectory(expand('%')) && !&modified | execute 'lua require(\"dired\").init()' | endif",
		group = dired_group,
	})

	vim.api.nvim_create_autocmd("VimEnter", {
		pattern = "*",
		command = "if exists('#FileExplorer') | execute 'autocmd! FileExplorer *' | endif",
		group = dired_group,
	})

	vim.api.nvim_create_autocmd("VimEnter", {
		pattern = "*",
		command = "if exists('#NERDTreeHijackNetrw') | exe 'au! NERDTreeHijackNetrw *' | endif",
		group = dired_group,
	})

	vim.cmd([[if exists('#FileExplorer') | execute 'autocmd! FileExplorer *' | endif]])
	vim.g.dired_loaded = true
end

return M
