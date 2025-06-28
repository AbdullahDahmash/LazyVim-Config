return {
  "mason-org/mason.nvim",
  optional = true,
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(
      opts.ensure_installed,
      {
        "erb-formatter",
        "erb-lint",
        "prettier",
        "cmakelang",
        "cmakelint",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",
        "templ",
        "codelldb",
      }
    )
    table.insert(opts.ensure_installed, "js-debug-adapter")
    if diagnostics == "bacon-ls" then
      vim.list_extend(opts.ensure_installed, { "bacon" })
    end
  end,
}
