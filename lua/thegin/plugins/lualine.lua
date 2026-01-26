local colors = require("gruvbox-baby.colors").config()
local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	hide_lsp_diagnostics = function()
		return vim.o.columns > 140
	end,
	hide_diff = function()
		return vim.o.columns > 120
	end,
	hide_line_col = function()
		return vim.o.columns > 140
	end,
	hide_cwd = function()
		return vim.o.columns > 80
	end,
}
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "gruvbox-baby",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"mode",
						icon = "",
						color = function()
							local mode_color = {
								n = colors.light_blue,
								i = colors.magenta,
								v = colors.red,
								[""] = colors.red,
								V = colors.red,
								c = colors.comment,
								R = colors.orange,
								no = colors.error_red,
								Rv = colors.orange,
								r = colors.orange,
								rm = colors.orange,
								["r?"] = colors.orange,
								t = colors.blue_gray,
							}
							return { fg = mode_color[vim.fn.mode()], bg = colors.background }
						end,
					},
					{
						"filetype",
						icon_only = true,
						colored = false,
						-- color = { fg = colors.fg, bg = colors.mbg },
						color = { fg = colors.foreground, bg = colors.dark0 },
						padding = { left = 1, right = 0 },
					},
					{
						"filename",
						cond = conditions.buffer_not_empty,
						-- color = { fg = colors.fg, bg = colors.mbg },
						color = { fg = colors.foreground, bg = colors.dark0 },
						padding = { left = 1, right = 1 },
					},
					{
						"branch",
						icon = "",
						color = { fg = colors.foreground, bg = colors.dark0 },
						padding = { left = 1, right = 1 },
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = "󰅚 ", warn = " ", info = " ", hint = "󰛩 " },
						cond = conditions.hide_lsp_diagnostics,
						colored = true,
						always_visible = true,
					},
				},
				lualine_x = {
					{
						"diff",
						colored = true,
						symbols = { added = " ", modified = " ", removed = " " },
						diff_color = {
							added = { fg = colors.soft_green, bg = colors.dark0 },
							modified = { fg = colors.orange, bg = colors.dark0 },
							removed = { fg = colors.error_red, bg = colors.dark0 },
						},
						cond = conditions.hide_diff,
					},
					{
						function()
							return "Ln %l, Col %c"
						end,
						-- color = { fg = colors.fg, bg = colors.mbg },
						color = { fg = colors.foreground, bg = colors.dark0 },
						cond = conditions.hide_line_col,
						-- icon = "|",
					},
					{
						function()
							local msg = ""
							-- local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								if client.name == "copilot" then
									return ""
								end
							end
							return msg
						end,
					},
					{
						function()
							local msg = "No Active Lsp"
							-- local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								if client.name ~= "null-ls" and client.name ~= "copilot" then
									return (vim.o.columns > 100 and client.name) or "LSP"
								end
							end
							return msg
						end,
						icon = "󰄭 ",
						-- color = { fg = colors.lsp, bg = colors.mbg },
						color = { fg = colors.milk, bg = colors.dark0 },
					},
				},
				lualine_y = {},
				lualine_z = {
					{
						function()
							local filepath = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
							return "󰉖 " .. filepath
						end,
						color = { bg = colors.background, fg = colors.gray },
						cond = conditions.hide_cwd,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
