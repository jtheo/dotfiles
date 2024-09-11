return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  init = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>SC", ":Silicon<CR>", desc = "Snapshot Code" },
    })
  end,
  config = function()
    require("silicon").setup({
      font = "JetBrainsMono NF=34",
      theme = "catppuccin",
      output = function()
        return "~/Downloads/Screenshots/Screenshot " .. os.date("!%Y-%m-%d at %H-%M-%S") .. "_code.png"
      end,
      window_title = function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
      end,
    })
  end,
}

-- ["<leader>SC"] = { ":Silicon<CR>", "Snapshot Code" },
