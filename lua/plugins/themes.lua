return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		-- config = function()
		-- 	vim.cmd.colorscheme("tokyonight")
		-- end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
		-- end,
		require("cyberdream").setup({
			-- Enable transparent background
			transparent = true,
			-- Reduce the overall saturation of colours for a more muted look
			saturation = .5, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

			-- Enable italics comments
			italic_comments = true,

			-- Replace all fillchars with ' ' for the ultimate clean look
			hide_fillchars = false,

			-- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
			borderless_pickers = false,

			-- Set terminal colors used in `:terminal`
			terminal_colors = true,

			-- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
			cache = false,

			-- Override highlight groups with your own colour values
			highlights = {
				-- Highlight groups to override, adding new groups is also possible
				-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

				-- Example:
--				Comment = { fg = "#696969", bg = "NONE", italic = true },

				-- More examples can be found in `lua/cyberdream/extensions/*.lua`
			},
		})
	 	vim.cmd.colorscheme("cyberdream")
		end,
	},
}
