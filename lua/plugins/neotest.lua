return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "olimorris/neotest-rspec",
    "fredrikaverpil/neotest-golang",
  },
  opts = {
    adapters = {
      ["rustaceanvim.neotest"] = {},
      ["neotest-golang"] = {
        -- Here we can set options for neotest-golang, e.g.
        -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
        dap_go_enabled = true, -- requires leoluz/nvim-dap-go
      },
      ["neotest-rspec"] = {
        -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
        -- rspec_cmd = function()
        --   return vim.tbl_flatten({
        --     "bundle",
        --     "exec",
        --     "rspec",
        --   })
        -- end,
      },
    },
  },
}
