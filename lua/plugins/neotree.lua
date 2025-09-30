return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	config = function()
		vim.keymap.set("n", "<leader>ft", "<Cmd>Neotree toggle<cr>", { desc = "Tree browser" })
	end,
}
