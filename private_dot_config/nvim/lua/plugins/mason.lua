return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "shfmt",
        "tfsec",
        "awk-language-server",
        "bash-language-server",
      },
    },
    {
      "nvimtools/none-ls.nvim",
      opts = function(_, opts)
        local nls = require("null-ls")
        opts.sources = vim.list_extend(opts.sources, {
          nls.builtins.formatting.shfmt.with({
            extra_args = { "-i", "2", "-ci", "-kp" },
          }),
        })
      end,
    },
    { import = "plugins" },
  },
}
