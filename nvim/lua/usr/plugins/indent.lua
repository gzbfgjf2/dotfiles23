local config = function()
  -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=242 guibg=#35383d]]
  -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=245 guibg=#3d3e40]]
  require("ibl").setup({
    indent = { char = "" },
    whitespace = {
      highlight = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        -- "CursorColumn",
        -- "Whitespace",
      },
      remove_blankline_trail = false,
    },
    scope = { enabled = false },
  })
  vim.g.indent_blankline_filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "neo-tree",
    "Trouble",
  }
  -- for _, keymap in pairs({
  --   'zo',
  --   'zO',
  --   'zc',
  --   'zC',
  --   'za',
  --   'zA',
  --   'zv',
  --   'zx',
  --   'zX',
  --   'zm',
  --   'zM',
  --   'zr',
  --   'zR',
  -- }) do
  --   vim.api.nvim_set_keymap('n', keymap,
  --     keymap .. '',
  --     { noremap = true, silent = true })
  -- end
end
return {
  "lukas-reineke/indent-blankline.nvim",
  config = config,
  dependencies = "navarasu/onedark.nvim"
}
