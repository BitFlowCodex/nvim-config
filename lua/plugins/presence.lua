return {
	"vyfor/cord.nvim",
	event = "VeryLazy",
	config = function()
		require("cord").setup({
			enabled = true,
			idle = {
				enabled = false,
			},
			text = {
				default = nil,
				workspace = "",
				--viewing = nil,
				--editing = nil,
				--file_browser = false,
				--plugin_manager = nil,
				--lsp = false,
				--docs = nil,
				--vcs = false,
				--notes = false,
				--debug = false,
				--test = false,
				--diagnostics = nil,
				--games = false,
				--terminal = nil,
				--dashboard = nil,
			},
		})
	end,
}
