return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = { "erb-formatter", "erb-lint" }
    table.insert(opts.ensure_installed, "js-debug-adapter")
  end,
}
