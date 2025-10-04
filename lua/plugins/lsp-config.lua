local lsps = vim.g.lsps -- lsps defined in core/vars.lua

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				vim.api.nvim_create_user_command("MasonInstallAll", function()
					vim.cmd("MasonInstall " .. table.concat(lsps, " "))
				end, {}),
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", {
				--	root_markers = {
				--			".git",
				--		},
				capabilities = {
					textDocument = {
						semanticTokens = {
							multilineTokenSupport = true,
						},
					},
				},
			})
			vim.lsp.enable(lsps)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go Declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go declaration" })
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
		end,
	},
}
