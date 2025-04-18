local setup = function()
	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "󰅚 ",
                [vim.diagnostic.severity.WARN] = "󰀪 ",
                [vim.diagnostic.severity.HINT] = "󰌶 ",
                [vim.diagnostic.severity.INFO] = "󰋽 ",
            }
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "none",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

return {
    setup = setup
}
