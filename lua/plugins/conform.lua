return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ruby = { formatter },
      eruby = { "erb_format" },
      html = { "prettier" },
      css = { "prettier" },
      go = { "goimports", "gofumpt" },
      templ = { "templ" },
    },
  },
}
