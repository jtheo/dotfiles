return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        settings = {
          -- redhat = { telemetry = { enabled = false } },
          yaml = {
            keyOrdering = false,
            format = {
              enable = false,
            },
            -- validate = true,
            -- schemaStore = {
            --   -- Must disable built-in schemaStore support to use
            --   -- schemas from SchemaStore.nvim plugin
            --   enable = false,
            --   -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
            --   url = "",
            -- },
          },
        },
      },
    },
  },
}
