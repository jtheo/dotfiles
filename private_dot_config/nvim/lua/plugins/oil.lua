return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
			vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open current directory in oil" }),
			vim.keymap.set(
				"n",
				"<leader>O",
				require("oil").toggle_float,
				{ desc = "Open current directory in oil floating window" }
			),
		})
	end,
}
