return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = { "erb-formatter", "erb-lint", "prettier", "cmakelang", "cmakelint", "goimports", "gofumpt",
      "gomodifytags", "impl", "delve" }
    table.insert(opts.ensure_installed, "js-debug-adapter")
  end,
}
