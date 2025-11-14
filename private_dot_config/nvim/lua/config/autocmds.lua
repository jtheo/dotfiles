-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[autocmd BufRead,BufNewFile *.Jenkinsfile setfiletype groovy]])
vim.cmd([[autocmd BufRead,BufNewFile Jenkinsfile setfiletype groovy]])

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.hcl",
	callback = function()
		vim.notify("Formatting with terragrunt hclfmt...")
		local file = vim.fn.expand("%:p")
		vim.fn.jobstart("terragrunt hclfmt --terragrunt-hclfmt-file " .. vim.fn.shellescape(file), {
			on_exit = function()
				vim.cmd("e!")
			end,
		})
	end,
})
