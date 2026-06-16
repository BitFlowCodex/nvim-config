return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			" ██╗   ██╗ ██████╗ ██╗   ██╗██████╗ ███╗   ██╗ █████╗ ███╗   ███╗███████╗",
			" ╚██╗ ██╔╝██╔═══██╗██║   ██║██╔══██╗████╗  ██║██╔══██╗████╗ ████║██╔════╝",
			"  ╚████╔╝ ██║   ██║██║   ██║██████╔╝██╔██╗ ██║███████║██╔████╔██║█████╗  ",
			"   ╚██╔╝  ██║   ██║██║   ██║██╔══██╗██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝  ",
			"    ██║   ╚██████╔╝╚██████╔╝██║  ██║██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗",
			"    ╚═╝    ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝",
		}

		dashboard.section.header.opts.hl = "AlphaHeader"

		vim.api.nvim_set_hl(0, "AlphaHeader", {
			fg = "#00ff7f",
			bold = true,
		})

		dashboard.section.buttons.val = {
			dashboard.button("n", "  New file", ":enew<CR>"),
			dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("t", "󱎸  Find Text", ":Telescope live_grep<CR>"),
			dashboard.button("p", "  Open Project", ":Ex<CR>"),
			dashboard.button("q", "󰩈  Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.argc() == 0 then
					require("alpha").start(true)
				end
			end,
		})
	end,
}
