return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = 20, -- default width
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_hidden = false,
					hide_by_name = {},
				},
			},
		})
	end,
	lazy = false,
	vim.keymap.set("n", "<leader>e", ":Neotree toggle position=left<CR>", { noremap = true, silent = true }),
}
