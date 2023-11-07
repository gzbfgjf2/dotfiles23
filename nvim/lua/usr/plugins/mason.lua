return {
  "williamboman/mason.nvim",
  config = function()
    require('mason').setup({
      ui = {
        width = 0.5,
        height = 0.5
      }
    })
  end
}
