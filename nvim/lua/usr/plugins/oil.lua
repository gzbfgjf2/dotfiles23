return {
  'stevearc/oil.nvim',
  -- keys = "-",
  -- cmd = { "Oil", "Telescope" },
  config = function()
    require('oil').setup(
      {
        cleanup_delay_ms = false,
        float = {
          border = 'none'
        },
        preview = {
          border = 'solid',
          win_options = {
            winblend = 0,
          }
        },
        keymaps = {
          ["="] = "actions.cd",
          ["`"] = false,
          ["<C-v>"] = "actions.select_vsplit",
          ["<C-s>"] = false,
        }
      }
    )
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end
}
