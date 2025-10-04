return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"gitignore",
				"html",
				"helm",
				"javascript",
				"jinja",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"rust",
				"toml",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
			textobjects = { enable = true },
		})
	end,
	{
		"HiPhish/rainbow-delimiters.nvim",
--		event = "VeryLazy",
	},
}
