local config = function()
  require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end
  })
  local zr_refresh = function()
    require("ufo").openAllFolds()
    -- require('indent_blankline').refresh()
  end
  local zm_refresh = function()
    require("ufo").closeAllFolds()
    -- require('indent_blankline').refresh()
  end
  -- capabilities.textDocument.foldingRange = {
  --   dynamicRegistration = false,
  --   lineFoldingOnly = true
  -- }
  -- vim.cmd([[autocmd BufReadPost, fileReadPost * normal zR]])
  vim.o.foldcolumn = "0"
  vim.o.foldlevel = 999 -- Using ufo provider need a large value, feel free to decrease the value
  -- vim.o.foldlevelstart = 99
  vim.o.foldlevelstart = 999
  vim.o.foldenable = true
  -- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  -- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  vim.keymap.set("n", "zR", zr_refresh)
  vim.keymap.set("n", "zM", zm_refresh)
end
--
return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = config
}
