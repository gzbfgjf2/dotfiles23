local light = {
  highlights = {
    IndentBlanklineIndent1 = { fg = "#e7edee", bg = "#e7edee" },
    IndentBlanklineIndent2 = { fg = "#cfd4d5", bg = "#cfd4d5" },
    EndOfBuffer = { fg = "#282c34", bg = nil },
    WinSeparator = { bg = "#3b3f4c", fg = "#3b3f4c" }
  }
}
local dark = {
  highlights = {
    -- ....
    IndentBlanklineIndent1 = { fg = "#35383d", bg = "#35383d" },
    IndentBlanklineIndent2 = { fg = "#3d3e40", bg = "#3d3e40" },
    EndOfBuffer = { fg = "#282c34", bg = nil },
    WinSeparator = { bg = "#3b3f4c", fg = "#3b3f4c" }
  },
}
local function get_theme_overrides(style)
  local palette = require("onedark.palette")[style]
  if type(palette) == "nil" then
    vim.notify(string.format("couldn't get palette for style %q", style),
      vim.log.levels.ERROR)
    return
  end

  if style == "light" then
    return light
    -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=242 guibg=#35383d]]
    -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=245 guibg=#3d3e40]]
  end
  return dark
end

local config = function()
  local onedark = require("onedark")
  local default_style = "dark"
  local augroup_id = vim.api.nvim_create_augroup("OnedarkStyle", {})
  vim.api.nvim_clear_autocmds({ group = augroup_id })
  vim.api.nvim_create_autocmd("ColorSchemePre", {
    group = augroup_id,
    desc = "Apply theme overrides before colorscheme change",
    callback = function()
      if vim.g.onedark_config and vim.g.onedark_config.loaded then
        local overrides = get_theme_overrides(vim.g.onedark_config.style)
        onedark.set_options("highlights", overrides.highlights)
      end
    end,
  })
  onedark.setup({
    toggle_style_key = "<leader>ts",
    toggle_style_list = { "light", "darker", "cool", "deep", "warm", "warmer", "dark" },
    -- highlights = get_theme_overrides(default_style).highlights,
  })
  onedark.load()
  vim.cmd [[colorscheme onedark]]
  vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#282c34" })
  vim.cmd([[hi WinSeparator guibg=#3b3f4c guifg=#3b3f4c]])
end


return {
  "navarasu/onedark.nvim",
  config = config
  -- require('onedark').setup {
  -- style = 'dark',
  -- highlights = {
  -- }
}
