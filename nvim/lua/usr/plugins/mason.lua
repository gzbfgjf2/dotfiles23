return {
  "williamboman/mason.nvim",
  config = function()
    require('mason').setup({
      ui = {
        width = 1,
        height = 1
      }
    })
  end
}
