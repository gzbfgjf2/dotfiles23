return {
  "nvim-telescope/telescope.nvim",

  tag = '0.1.4',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({
      defaults = {
        -- theme = "dropdown",
        sorting_strategy = "ascending",
        layout_strategy = "center",
        border = false,
        prompt_title = "",
        results_title = "",
        preview_title = "",
        prompt_prefix = "",
        selection_caret = "",
        entry_prefix = "",
        multi_icon = "",
        color_devicons = false,
        preview = { msg_bg_fillchar = ' ' },
        layout_config = {
          anchor = "N",
          -- width = 99
        },
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            -- ["<C-h>"] = "which_key"
          },
          -- n = {
          --   ["<Leader>jp"] = require'telescope'.builtin.jumplist
          -- }
        }
      },
    })
    -- vim.cmd([[hi TelescopeNormal guibg=#31353f]])
    -- vim.cmd([[hi TelescopeNormal guibg=#331D2C]])
    vim.cmd([[hi TelescopeNormal guibg=#303841]])
    -- vim.cmd([[hi TelescopeNormal guibg=#4C566A]])
    -- vim.cmd([[hi TelescopeNormal guibg=#222831]])
    --
    -- vim.cmd([[hi TelescopePreviewNormal guibg=#302835]])
    -- vim.cmd([[hi TelescopePreviewNormal guibg=#3F2E3E]])
    vim.cmd([[hi TelescopePreviewNormal guibg=#3A4750]])
    -- vim.cmd([[hi TelescopePreviewNormal guibg=#2E3440]])
    -- vim.cmd([[hi TelescopePreviewNormal guibg=#393E46]])
    --
    -- vim.cmd([[hi TelescopePromptNormal guibg=#3B4252]])
    -- vim.cmd([[hi TelescopePromptNormal guibg=#475569]])
    -- vim.cmd([[hi TelescopePromptNormal guibg=#FFD369]])
    -- vim.cmd([[hi TelescopePromptNormal  guibg=#393f4a]])

    -- vim.cmd([[hi MsgArea guibg=#1E313B]])
    -- vim.cmd([[hi MsgArea guibg=#1E293B]])
    -- vim.cmd([[hi MsgArea guibg=#475569]])
    -- vim.cmd([[hi link NoiceCmdlinePopup NormalFloat]])
    vim.cmd([[hi NoiceCmdlinePopup guibg=#475569]])
    -- vim.cmd([[hi NoiceCmdlinePopup guibg=white]])
  end
}
