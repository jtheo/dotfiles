return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "awk-language-server",
        "bash-language-server",
        "shellcheck",
        "shfmt",
        "tfsec",
        "prettier",
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
