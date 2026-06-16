-- Fuzzy Finder (files, lsp, etc)
return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.6,
						width = { padding = 0 },
						height = { padding = 0 },
					},
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-l>"] = actions.select_default,
					},
					n = {
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					file_ignore_patterns = { "node_modules", "%.git", "%.venv" },
					hidden = true,
				},
				buffers = {
					initial_mode = "normal",
					sort_lastused = true,
					-- sort_mru = true,
					mappings = {
						n = {
							["d"] = actions.delete_buffer,
							["l"] = actions.select_default,
						},
					},
				},
				marks = {
					initial_mode = "normal",
				},
				oldfiles = {
					initial_mode = "normal",
				},
			},
			live_grep = {
				file_ignore_patterns = { "node_modules", ".git", ".venv" },
				additional_args = function(_)
					return { "--hidden" }
				end,
			},
			path_display = {
				filename_first = {
					reverse_directories = true,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			git_files = {
				previewer = false,
			},
		})
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Files" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search Word" })
		vim.keymap.set("n", "<leader><Space>", builtin.live_grep, { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume" })
		vim.keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "Recent Files" })
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git Files" })
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
		vim.keymap.set("n", "<leader>gcf", builtin.git_bcommits, { desc = "Git File Commits" })
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
		vim.keymap.set("n", "<leader>sds", function()
			builtin.lsp_document_symbols({
				symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Property" },
			})
		end, { desc = "[S]each LSP document [S]ymbols" })
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
	end,
}
