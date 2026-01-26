return {
	"luisiacc/gruvbox-baby",
	branch = main,
	config = function()
		-- Example config in Lua
		local colors = require("gruvbox-baby.colors").config()
		vim.g.gruvbox_baby_function_style = "bold"
		vim.g.gruvbox_baby_keyword_style = "NONE"

		-- Each highlight group must follow the structure:
		-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
		-- See also :h highlight-guifg
		-- Example:
		vim.g.gruvbox_baby_highlights = {
			TelescopePromptBorder = { bg = colors.dark0, fg = colors.milk },
			TelescopePreviewBorder = { bg = colors.dark0, fg = colors.milk },
			TelescopeResultsBorder = { bg = colors.dark0, fg = colors.milk },
			TelescopePromptNormal = { bg = colors.dark0, fg = colors.milk },
			TelescopePreviewNormal = { bg = colors.dark0, fg = colors.milk },
			TelescopeResultsNormal = { bg = colors.dark0, fg = colors.milk },
			TelescopeSelection = { fg = colors.soft_yellow, style = "bold" },
			TelescopeSelectionCaret = { fg = colors.soft_yellow, style = "bold" },
			TelescopeMatching = { fg = colors.light_blue, style = "bold" },
			Statusline = { bg = colors.dark0, fg = colors.milk },
			ColorColumn = { bg = "#171a1a" },
		}

		-- Enable telescope theme
		vim.g.gruvbox_baby_telescope_theme = 0

		-- Enable transparent mode
		vim.g.gruvbox_baby_transparent_mode = 1

		-- Load the colorscheme
		vim.cmd([[colorscheme gruvbox-baby]])
	end,
}

-- return {
--     {
-- 	"thesimonho/kanagawa-paper.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	init = function()
-- 		vim.cmd.colorscheme("kanagawa-paper-ink")
-- 	end,
-- 	opts = {
-- 		undercurl = true,
-- 		-- transparent background
-- 		transparent = true,
-- 		-- highlight background for the left gutter
-- 		gutter = false,
-- 		-- background for diagnostic virtual text
-- 		diag_background = true,
-- 		-- dim inactive windows. Disabled when transparent
-- 		dim_inactive = false,
-- 		-- set colors for terminal buffers
-- 		terminal_colors = true,
-- 		-- cache highlights and colors for faster startup.
-- 		-- see Cache section for more details.
-- 		cache = false,
--
-- 		styles = {
-- 			-- style for comments
-- 			comment = { italic = true },
-- 			-- style for functions
-- 			functions = { italic = false, bold = true },
-- 			-- style for keywords
-- 			keyword = { italic = false, bold = true },
-- 			-- style for statements
-- 			statement = { italic = false, bold = false },
-- 			-- style for types
-- 			type = { italic = false },
-- 		},
-- 		-- override default palette and theme colors
-- 		colors = {
-- 			palette = {},
-- 			theme = {
-- 				ink = {},
-- 				canvas = {},
-- 			},
-- 		},
-- 		-- adjust overall color balance for each theme [-1, 1]
-- 		color_offset = {
-- 			ink = { brightness = 0, saturation = 0 },
-- 			canvas = { brightness = 0, saturation = 0 },
-- 		},
-- 		-- override highlight groups
-- 		overrides = function(colors)
-- 			local theme = colors.palette
-- 			return {
-- 				StatusLine = { fg = theme.fujiWhite, bg = "#333333" },
-- 				TelescopeResultsNormal = { bg = theme.dragonBlack1, fg = theme.fujiWhite },
-- 				TelescopePreviewNormal = { bg = theme.dragonBlack2 },
-- 				TelescopePromptNormal = { bg = theme.dragonBlack0, fg = theme.carpYellow },
-- 				TelescopePromptBorder = { bg = theme.dragonBlack0 },
-- 				TelescopePreviewBorder = { bg = theme.dragonBlack2 },
-- 				TelescopeResultsBorder = { bg = theme.dragonBlack1 },
-- 				TelescopeMatching = { fg = theme.dragonBlue2, bold = true, nocombine = true },
-- 				TelescopeSelection = { fg = theme.carpYellow, bold = true },
-- 				TelescopeSelectionCaret = { fg = theme.carpYellow, bold = true },
-- 				TelescopePreviewTitle = { fg = theme.lotusBlue5, bg = theme.lotusCyan },
-- 				TelescopePromptTitle = { fg = theme.fujiWhite, bg = theme.fujiGray },
-- 				-- FUNCTIONS — bold yellow (defs + calls)
-- 				["@function.builtin"] = { fg = theme.carpYellow, bold = true },
-- 				["@function.call.builtin"] = { fg = theme.carpYellow, bold = true },
--
-- 				["@method.builtin"] = { fg = theme.carpYellow, bold = true },
-- 				["@method.call.builtin"] = { fg = theme.carpYellow, bold = true },
-- 				["@function"] = { fg = theme.autumnYellow, bold = true },
-- 				["@function.call"] = { fg = theme.autumnYellow, bold = true },
-- 				["@method"] = { fg = theme.autumnYellow, bold = true },
-- 				["@method.call"] = { fg = theme.autumnYellow, bold = true },
--
-- 				-- VARIABLES — plain fujiWhite
-- 				["@variable"] = { fg = theme.fujiWhite },
-- 				["@variable.builtin"] = { fg = theme.oldWhite },
--
-- 				-- CONSTANTS / IMMUTABLE — bold blue
-- 				["@constant"] = { fg = theme.crystalBlue, bold = true },
-- 				["@constant.builtin"] = { fg = theme.crystalBlue, bold = true },
-- 				["@property"] = { fg = theme.springBlue },
--
-- 				-- KEYWORDS — red
-- 				["@keyword"] = { fg = theme.autumnRed },
-- 				["@keyword.return"] = { fg = theme.autumnRed },
-- 				["@keyword.operator"] = { fg = theme.autumnRed },
--
-- 				-- CONTROL FLOW — light blue
-- 				["@conditional"] = { fg = theme.lightBlue },
-- 				["@repeat"] = { fg = theme.lightBlue },
-- 				["@exception"] = { fg = theme.lightBlue },
--
-- 				-- TYPES — calm violet
-- 				["@type"] = { fg = theme.oniViolet },
-- 				["@type.builtin"] = { fg = theme.oniViolet },
--
-- 				-- OPERATORS / PUNCTUATION — low contrast
-- 				["@operator"] = { fg = theme.fujiGray },
-- 				["@punctuation.delimiter"] = { fg = theme.katanaGray },
-- 			}
-- 		end,
--
-- 		-- uses lazy.nvim, if installed, to automatically enable needed plugins
-- 		auto_plugins = true,
-- 		-- enable highlights for all plugins (disabled if using lazy.nvim)
-- 		all_plugins = package.loaded.lazy == nil,
-- 		-- manually enable/disable individual plugins.
-- 		-- check the `groups/plugins` directory for the exact names
-- 		plugins = {
-- 			-- examples:
-- 			-- rainbow_delimiters = true
-- 			-- which_key = false
-- 		},
-- 	},
-- }
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "auto", -- auto, main, moon, or dawn
-- 			dark_variant = "main", -- main, moon, or dawn
-- 			dim_inactive_windows = false,
-- 			extend_background_behind_borders = true,
--
-- 			enable = {
-- 				terminal = true,
-- 				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
-- 				migrations = true, -- Handle deprecated options automatically
-- 			},
--
-- 			styles = {
-- 				bold = true,
-- 				italic = true,
-- 				transparency = true,
-- 			},
--
-- 			groups = {
-- 				border = "muted",
-- 				link = "iris",
-- 				panel = "surface",
--
-- 				error = "love",
-- 				hint = "iris",
-- 				info = "foam",
-- 				note = "pine",
-- 				todo = "rose",
-- 				warn = "gold",
--
-- 				git_add = "foam",
-- 				git_change = "rose",
-- 				git_delete = "love",
-- 				git_dirty = "rose",
-- 				git_ignore = "muted",
-- 				git_merge = "iris",
-- 				git_rename = "pine",
-- 				git_stage = "iris",
-- 				git_text = "rose",
-- 				git_untracked = "subtle",
--
-- 				h1 = "iris",
-- 				h2 = "foam",
-- 				h3 = "rose",
-- 				h4 = "gold",
-- 				h5 = "pine",
-- 				h6 = "foam",
-- 			},
--
-- 			palette = {
-- 				-- Override the builtin palette per variant
-- 				-- moon = {
-- 				--     base = '#18191a',
-- 				--     overlay = '#363738',
-- 				-- },
-- 			},
--
-- 			-- NOTE: Highlight groups are extended (merged) by default. Disable this
-- 			-- per group via `inherit = false`
-- 			highlight_groups = {
-- 				["@Comments"] = { fg = "muted" },
-- 				["@Operator"] = { fg = "subtle" },
-- 				["@Punctuation"] = { fg = "subtle" },
-- 				["@variables"] = { fg = "text" },
-- 				["@builtins"] = { fg = "love" },
-- 				["@Strings"] = { fg = "gold" },
-- 				["@booleans"] = { fg = "rose" },
-- 				["@functions"] = { fg = "rose" },
-- 				["@conditionals"] = { fg = "pine" },
-- 				["@keywords"] = { fg = "pine" },
-- 				["@keys"] = { fg = "foam" },
-- 				["@tags"] = { fg = "foam" },
-- 				["@types"] = { fg = "foam" },
-- 				["@method"] = { fg = "iris" },
-- 				["@parameters"] = { fg = "iris" },
-- 				StatusLine = { fg = "iris", bg = "#333333" },
-- 				TelescopeResultsNormal = { bg = "surface", fg = "text" },
-- 				TelescopePreviewNormal = { bg = "overlay", fg = "text" },
-- 				TelescopePromptNormal = { bg = "base", fg = "text" },
-- 				TelescopePromptBorder = { bg = "base" },
-- 				TelescopePreviewBorder = { bg = "overlay" },
-- 				TelescopeResultsBorder = { bg = "surface" },
-- 				TelescopeMatching = { fg = "gold", bold = true, nocombine = true },
-- 				TelescopeSelection = { bg = "muted" },
-- 				TelescopeSelectionCaret = { fg = "none" },
-- 				TelescopePreviewTitle = { fg = "base", bg = "rose" },
-- 				TelescopePromptTitle = { fg = "highlight_low", bg = "gold" },
-- 			},
--
-- 			before_highlight = function(group, highlight, palette)
-- 				-- disable all undercurls
-- 				-- if highlight.undercurl then
-- 				--     highlight.undercurl = false
-- 				-- end
-- 				--
-- 				-- change palette colour
-- 				-- if highlight.fg == palette.pine then
-- 				--     highlight.fg = palette.foam
-- 				-- end
-- 			end,
-- 		})
--
-- 		vim.cmd("colorscheme rose-pine-main")
-- 		-- vim.cmd("colorscheme rose-pine-main")
-- 		-- vim.cmd("colorscheme rose-pine-moon")
-- 		-- vim.cmd("colorscheme rose-pine-dawn")
-- 	end,
-- }
