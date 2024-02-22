local M = {}

local getDiagnostics = function()
	local diagnostics = vim.diagnostic.get(0)
	local count = { 0, 0, 0, 0 }
	for _, diagnostic in ipairs(diagnostics) do
		count[diagnostic.severity] = count[diagnostic.severity] + 1
	end

	return count[vim.diagnostic.severity.ERROR],
		count[vim.diagnostic.severity.WARN],
		count[vim.diagnostic.severity.INFO],
		count[vim.diagnostic.severity.HINT]
end

local go_to_error = function(backwards)
	backwards = backwards or false
	local error_count, warn_count, info_count, hint_count = getDiagnostics()
	local goto_next = backwards and vim.diagnostic.goto_prev or vim.diagnostic.goto_next
	if error_count > 0 then
		goto_next({ severity = vim.diagnostic.severity.ERROR })
	elseif warn_count > 0 then
		goto_next({ severity = vim.diagnostic.severity.WARN })
	elseif info_count > 0 then
		goto_next({ severity = vim.diagnostic.severity.INFO })
	elseif hint_count > 0 then
		goto_next({ severity = vim.diagnostic.severity.HINT })
	end
end

M.go_to_next_error = function()
	go_to_error()
end

M.go_to_prev_error = function()
	go_to_error(true)
end

local get_current_line_git_hash = function()
	local location = vim.fn.expand("%")
	local line = vim.api.nvim_win_get_cursor(0)[1]
	local params = {
		"log",
		"-L",
		line .. "," .. line .. ":" .. location,
		"--pretty=oneline",
		"--abbrev-commit",
		"--no-patch",
		"-1",
	}
	local command = vim.list_extend({ "git" }, params)
	return vim.system(command, { text = true }):wait().stdout:gsub("%s.+", "")
end

M.open_line_commit_diff = function()
	local commit = get_current_line_git_hash()
	vim.cmd("DiffviewOpen " .. commit .. "^.." .. commit)
end

return M
