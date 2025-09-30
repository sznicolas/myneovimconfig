-- Install and configure:
-- * gitsigns
-- * vgit

return {
	{
		"tanvirtin/vgit.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		-- Lazy loading on 'VimEnter' event is necessary.
		event = "VimEnter",
		config = function()
			require("vgit").setup()
			local vgit = require("vgit") -- .setup()
            vgit.toggle_diff_preference()
			vim.keymap.set("n", "<leader>gd", vgit.buffer_diff_preview, { desc = "Git Diff preview" })
			vim.keymap.set("n", "<leader>gD", vgit.project_diff_preview, { desc = "Git Diff project preview" })
			vim.keymap.set("n", "<leader>gh", vgit.buffer_history_preview, { desc = "Git History preview" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",

		config = function()
			require("gitsigns").setup({
				signs = {
					add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
					change = {
						hl = "GitSignsChange",
						text = "│",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "_",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "‾",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "~",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				},
			})
		end,
	},
}
