return {
  "kylechui/nvim-surround",
  -- Use for stability; omit to use `main` branch for the latest features
  -- tag = "*",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      keymaps = {
        visual = "<leader>s",
        visual_line = "<leader>S",
      },
    })
  end
}
