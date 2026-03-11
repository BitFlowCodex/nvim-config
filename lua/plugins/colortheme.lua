return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
	        transparent_background = false,
	        term_colors = true,
        })

        vim.cmd.colorscheme("catppuccin")

        local transparent_bg = true
        local toggle_transparency = function()
            transparent_bg = not transparent_bg

            require("catppuccin").setup({
                flavour = "mocha",
	            transparent_background = transparent_bg,
	            term_colors = true,
            })
            vim.cmd.colorscheme("catppuccin")
        end

        vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
    end
}
