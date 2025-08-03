return {
  "mason-org/mason.nvim",
  optional = true,
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  opts_extend = { "ensure_installed" },
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, {
      "stylua",
      "shfmt",
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
    })
    table.insert(opts.ensure_installed, "js-debug-adapter")
    if diagnostics == "bacon-ls" then
      vim.list_extend(opts.ensure_installed, { "bacon" })
    end
  end,
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    mr:on("package:install:success", function()
      vim.defer_fn(function()
        -- trigger FileType event to possibly load this newly installed LSP server
        require("lazy.core.handler.event").trigger({
          event = "FileType",
          buf = vim.api.nvim_get_current_buf(),
        })
      end, 100)
    end)

    mr.refresh(function()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end)
  end,
}
