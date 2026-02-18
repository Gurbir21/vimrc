return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
        require("rose-pine").setup({
            variant = "auto", -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            palette = {
                -- Override the builtin palette per variant
                -- moon = {
                    --     base = '#18191a',
                    --     overlay = '#363738',
                    -- },
                },

                -- NOTE: Highlight groups are extended (merged) by default. Disable this
                -- per group via `inherit = false`
                highlight_groups = {
                    StatusLine = { bg = "surface", fg = "text" },
                    BlinkCmpMenuSelection = { bg = "muted", fg = "text", bold = true  },
                    BlinkCmpMenu = { bg = "surface", fg = "subtle" },
                    BlinkCmpMenuBorder = { fg = "muted", bg = "surface" },
                    NormalFloat = { bg = "surface", fg = "text" },
                    FloatBorder = { bg = "surface", fg = "muted" },
                    TelescopePromptBorder = { bg = "surface", fg = "muted" },
                    TelescopePromptNormal = { bg = "surface", fg = "text" },
                    TelescopeResultsBorder = { bg = "surface", fg = "muted" },
                    TelescopeResultsNormal = { bg = "surface", fg = "text" },
                    TelescopePreviewBorder = { bg = "surface", fg = "muted" },
                    TelescopePreviewNormal = { bg = "surface" },
                },

                before_highlight = function(group, highlight, palette)
                    -- Disable all undercurls
                    -- if highlight.undercurl then
                    --     highlight.undercurl = false
                    -- end
                    --
                    -- Change palette colour
                    -- if highlight.fg == palette.pine then
                    --     highlight.fg = palette.foam
                    -- end
                end,
            })
		vim.cmd("colorscheme rose-pine")
	end
}
