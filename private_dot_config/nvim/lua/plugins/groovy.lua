return {

  vim.cmd([[autocmd BufRead,BufNewFile *.Jenkinsfile setfiletype groovy]]),
  vim.cmd([[autocmd BufRead,BufNewFile Jenkinsfile setfiletype groovy]]),
}
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         groovyls = {
--           cmd = {
--             "java",
--             "-jar",
--             "/Users/mattmar1/bin/groovy-language-server-all.jar",
--           },
--           filetypes = {
--             "Jenkinsfile",
--             "groovy",
--           },
--         },
--       },
--     },
--   },
-- }

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         groovyls = {
--           cmd = {
--             "java",
--             "-jar",
--             "/Users/mattmar1/bin/groovy-language-server-all.jar",
--           },
--           filetypes = {
--             "groovy",
--             "Jenkinsfile",
--           },
--         },
--       },
--     },
--   },
-- }
