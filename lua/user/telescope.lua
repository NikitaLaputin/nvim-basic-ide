local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			center = {
				width = 0.7,
			},
			width = 0.9,
			height = 0.80,
			preview_cutoff = 0,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "", "", "", "", "", "", "", "" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		file_ignore_patterns = { ".git/", "node_modules", ".idea", ".vscode", ".fleet", "target" },
		extensions = {
			live_grep_args = {
				auto_quoting = true, -- enable/disable auto-quoting
				mappings = {
					i = {
						-- TODO fix keymap
						["<C-k>"] = lga_actions.quote_prompt({ postfix = " -g *.ts*" }),
					},
				},
			},
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	},
	pickers = {
		find_files = {
			-- theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		live_grep_args = {
			theme = "dropdown",
		},
	},
})

telescope.load_extension("live_grep_args")
telescope.load_extension("fzf")
