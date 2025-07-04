return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    opts = function(_, opts)
      opts.endwise = { enable = true }
      opts.indent = { enable = true, disable = { "yaml", "ruby" } }
      opts.ensure_installed = {
        "bash",
        "embedded_template",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "css",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "rust",
        "ron",
        "templ",
      }
      vim.list_extend(opts.ensure_installed, { "elixir", "heex", "eex", "glimmer" })
      vim.treesitter.language.register("markdown", "livebook")
    end,
  },
}
