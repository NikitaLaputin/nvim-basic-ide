require("blink.cmp").setup({
	fuzzy = { implementation = "lua" },
	keymap = {
		preset = "enter",
	},
	completion = {
		-- documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			draw = {
				columns = { { "kind_icon" }, { "label", gap = 1 } },
				components = {
					kind_icon = {
						text = function(ctx)
							local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
							return kind_icon
						end,
						-- (optional) use highlights from mini.icons
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
					kind = {
						-- (optional) use highlights from mini.icons
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
	},
	cmdline = {
		enabled = false,
	},
})
