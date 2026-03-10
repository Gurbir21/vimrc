local map = vim.keymap.set


-- Vim Remaps --
map("n", "<leader>e", vim.cmd.Ex)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<", "<gv")
map("v", ">", ">gv")
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-k>", ":cnext<CR>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-j>", ":cprev<CR>zz")


-- Telescope Remaps --
local builtin = require"telescope.builtin"
map("n", "<leader>sf", builtin.find_files)
map("n", "<leader>sg", builtin.git_files)
map("n", "<leader>sh", builtin.help_tags)
map("n", "<leader>sw", builtin.live_grep)
map("n", "<leader>sn", function()
		builtin.find_files {
				cwd = vim.fn.stdpath("config")
		}
end)
map("n", "<leader>sc", function()
		builtin.find_files {
				cwd = "~/.config"
		}
end)
map("n", "<leader>/", function()
		builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
				winblend = 10,
				previewer = false
		})
end)

-- Undotree --
map("n", "<leader>u", vim.cmd.UndotreeToggle)
