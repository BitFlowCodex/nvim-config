return { -- Autocompletion
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {

		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {

				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {},
		},
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",

			["<Tab>"] = {
				"accept",
				"snippet_forward",
				"fallback",
			},

			["<S-Tab>"] = {
				"snippet_backward",
				"fallback",
			},

			["<Enter>"] = {
				"accept",
				"snippet_forward",
				"fallback",
			},

			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },

			["<Down>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },

			["<C-space>"] = { "show", "fallback" },

			["<C-e>"] = { "hide", "fallback" },

			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
			list = {
				selection = {
					preselect = true,
				},
			},
			menu = {
				auto_show = true,
			},
		},

		sources = {
			default = { "lsp", "path", "snippets" },
		},

		snippets = { preset = "luasnip" },
		fuzzy = { implementation = "lua" },

		signature = { enabled = true },
	},
}
