# Neovim config

## Quickstart
Run in docker:
```
docker build -t neovim .
drit -v $PWD:/src -w /src --network none neovim bash
```
```
source .venv/bin/activate
```

## Keymaps

`<leader>` key is `<space>`

| Realm       | Action   | Map      |
| ----------- | ----------------------- | --------- |
| Help        | Print maps              | <ldr>? |
|  Files      | Find Files              | <ldr>ff           |
|  Files      | Find Buffers            |  <ldr>fb         |
|  Files      | Grep                    |  <ldr>fg         |
| Browse      | Toggle File Tree        | <ldr>- |
| Browse      | Oil                     | <ldr>- |
|  Git        | Open Neogit interface   |  <ldr>gg         |
|  Git        | Telescope Commits       |  <ldr>gc         |
|  Git        | Telescope Files         |  <ldr>gf         |
|  Git        | Telescope Files         |  <ldr>gf         |
|  Git        | Telescope Files         |  <ldr>gf         |
|  Code       | Code Formatter |  <ldr>cf         |
|  Code       | Code Action |  <ldr>ca         |
|  Code       | Go Definition |  gd         |
|  Code       | Go Declaration |  gD         |
|  Code       | Return to previous buffer |  <C-^>         |

```
./lua/plugins/git.lua:			vim.keymap.set("n", "<leader>gd", vgit.buffer_diff_preview, { desc = "Git Diff preview" })
./lua/plugins/git.lua:			vim.keymap.set("n", "<leader>gD", vgit.project_diff_preview, { desc = "Git Diff project preview" })
./lua/plugins/git.lua:			vim.keymap.set("n", "<leader>gh", vgit.buffer_history_preview, { desc = "Git History preview" })
./lua/plugins/telescope.lua:			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
./lua/plugins/telescope.lua:			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
./lua/plugins/telescope.lua:			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
./lua/plugins/telescope.lua:			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
./lua/plugins/telescope.lua:			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Telescope git_files " })
./lua/plugins/telescope.lua:			vim.keymap.set("n", "<leader>gl", builtin.git_commits, { desc = "Git log (Telescope.git_commits)" })
./lua/plugins/telescope.lua:			vim.keymap.set("n", "<leader>gst", builtin.git_commits, { desc = "Telescope git_status" })
./lua/plugins/debugging.lua:		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
./lua/plugins/debugging.lua:		vim.keymap.set("n", "<Leader>ds", dap.step_over, {})
./lua/plugins/debugging.lua:		vim.keymap.set("n", "<Leader>dS", dap.step_into, {})
./lua/plugins/debugging.lua:		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
./lua/plugins/debugging.lua:		vim.keymap.set("n", "<Leader>dB", dap.set_breakpoint, {})
./lua/plugins/none-ls.lua:		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code Formatter" })
```
## Tools quickstart
### Git
#### Neogit

* Open Neogit: `<leader>gg`
* Get help : `?`
* Here you can `p`ull, `P`ush, `c`ommit.
* Open a DiffView for all the workspace : `dw`
* Close Neogit tab : `:DiffViewClose`


## Installed LSPs
See [vim.g.lsps](lua/core/options.lua)

## Inspiration

- @typecraft_dev especially for Neovim for Newbs. FREE NEOVIM COURSE 
https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=2 

- V. Jousse https://vincent.jousse.org/blog/fr/tech/configurer-neovim-comme-ide-a-partir-de-zero-tutoriel-guide/ https://github.com/vjousse/neovim-from-scratch

