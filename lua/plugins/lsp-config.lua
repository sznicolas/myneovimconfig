local lsps = { "basedpyright", "lua_ls", "ruff", "stylua" }

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
				--       require("mason-lspcoonfig").setup() -- {
				-- ensure_installed = { "python-lsp-server" }
				ensure_installed = lsps,
				vim.api.nvim_create_user_command("MasonInstallAll", function()
					vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
				end, {}),
			})
		end,
	},
	--  { 'WhoIsSethDaniel/mason-tool-installer.nvim'},
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
      -- TODO: Replace with lsps
			vim.lsp.enable({ "lua_ls", "basedpyright", "ruff" })
		end,
	},
}
