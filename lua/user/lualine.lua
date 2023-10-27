local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = require("user.colorscheme")

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "hint" },
	symbols = { error = " ", warn = " ", hint = " " },
	colored = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
}

local location = {
	"location",
	left_padding = 0,
	right_padding = 2,
}

local filename = {
	"filename",
	shorting_target = 20,
	path = 1,
}

local branch = {
	"branch",
	max_length = 3,
}

local theme = {
	normal = {
		a = { fg = colors.white, bg = colors.blue },
		b = { fg = colors.black, bg = colors.pale_blue },
		c = { fg = colors.black, bg = colors.white },
		x = { fg = colors.black, bg = colors.pale_blue },
	},

	insert = { a = { fg = colors.white, bg = colors.green } },
	visual = { a = { fg = colors.white, bg = colors.gold } },
	replace = { a = { fg = colors.white, bg = colors.red } },

	inactive = {
		a = { fg = colors.gray, bg = colors.white },
		b = { fg = colors.gray, bg = colors.white },
		c = { fg = colors.black, bg = colors.white },
	},
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = theme,
		component_separators = "|",
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "" }, right_padding = 2, left_padding = 0 } },
		lualine_b = { branch, diagnostics },
		lualine_c = { filename },
		lualine_x = { { "searchcount", separator = { right = "|", left = "" } } },
		lualine_y = { location, diff },
		lualine_z = { { "progress", separator = { right = "" }, left_padding = 2 } },
	},
	winbar = {
		--   lualine_a = {},
		--   lualine_b = {},
		--   lualine_c = {},
		--   lualine_x = {},
		--   lualine_y = {},
		--   lualine_z = {},
	},
})
