return{
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- REQUIRED
		require("harpoon"):setup()
		-- REQUIRED
	end
}
