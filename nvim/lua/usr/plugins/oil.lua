return {
  'stevearc/oil.nvim',
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
        }
      }
    )
  end
}
