
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -- Raccourci pour la fonction set
local keymap = vim.keymap.set

-- TODO: Reporter les keymaps ici, exemple :
-- keymap("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })
