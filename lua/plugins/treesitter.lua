return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "javascript",
        "html",
        "query",
        "python",
        "lua",
        "markdown",
        "markdown_inline",
        "rust",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml"
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
    })
  end
}
