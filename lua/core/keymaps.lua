
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -- Raccourci pour la fonction set
-- local keymap = vim.keymap.set

-- TODO: Reporter les keymaps ici, exemple :
-- keymap("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go Declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go definition" })
			vim.keymap.set({ "n" }, "<leader>da", vim.lsp.buf.code_action, { desc = "Code Action" })
