return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.1",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				-- borderchars = {
				-- 	prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
				-- 	results = { " " },
				-- 	preview = { " " },
				-- },
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.9,
					height = 0.85,
					preview_cutoff = 40,
					horizontal = {
						preview_width = 0.55,
						results_width = 0.45,
					},
				},
				selection_caret = "> ",
				prompt_prefix = " ",
				results_title = false,
			},

			pickers = {
				git_files = {
					layout_strategy = "vertical",
				},

				current_buffer_fuzzy_find = {
					layout_strategy = "vertical",
				},
			},
		})
	end,
}
