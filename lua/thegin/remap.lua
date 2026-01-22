local map = vim.keymap.set

map("n", "<leader>e", vim.cmd.Ex)

-- Telescope Commands
local builtin = require("telescope.builtin")
map("n", "<leader>sf", builtin.find_files, { desc = "Telescope [S]earch [f]iles" })
map("n", "<leader>sg", builtin.live_grep, { desc = "Telescope [G]rep [S]earch" })
map("n", "<leader>sb", builtin.buffers, { desc = "Telescope [S]earch [B]uffers" })
map("n", "<leader>sh", builtin.help_tags, { desc = "Telescope [S]earch [H]elp" })

-- Harpoon
local harpoon = require("harpoon")
map("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "[H]arpoon [A]dd" })
map("n", "<leader>hm", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "[H]arpoon [M]enu" })

map("n", "<leader>ho", function()
	harpoon:list():select(1)
end, { desc = "[H]arpoon [O]ne" })
map("n", "<leader>ht", function()
	harpoon:list():select(2)
end, { desc = "[H]arpoon [T]wo" })
map("n", "<leader>hh", function()
	harpoon:list():select(3)
end, { desc = "[H]arpoon T[H]ree" })
map("n", "<leader>hf", function()
	harpoon:list():select(4)
end, { desc = "[H]arpoon [F]our" })

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<leader>hp", function()
	harpoon:list():prev()
end, { desc = "[H]arponn [P]rev" })
map("n", "<leader>hn", function()
	harpoon:list():next()
end, { desc = "[H]arpoon [N]ext" })

-- Undotree
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Open [U]ndotree" })

-- LazyGit
map("n", "<leader>g", "<cmd>LazyGit<cr>", { desc = "[L]azy[G]it" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to Clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Copy Line to Clipboard" })

map({ "n", "v" }, "<leader>d", '"_d', { desc = "[D]elete Permenantly" })

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")

map(
	"n",
	"<leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "[R]eplace Current Word in Your current buffer" }
)
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make [X]ecutable" })

-- Quickfix List
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Quickfix Next" })
map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Quickfix Prev" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Location List Prev" })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Location List Next" })
