return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 'nvim-lua/plenary.nvim' },
  -- keys = {},
  -- event = "BufEnter",
  cmd = 'Telescope',
  module = 'telescope',
  keys = {
    -- disable the keymap to grep files
    -- { "<leader>/",  false },
    -- change a keymap
    -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({
          cwd = require(
            "lazy.core.config").options.root
        })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>fm",
      function() require("telescope.builtin").marks() end,
      desc = "Find marks."
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        -- theme = "dropdown",
        -- winblend = 10,
        sorting_strategy = "ascending",
        -- layout_strategy = "center",
        layout_strategy = "bottom_pane",
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
          -- width = 112
          width = 0.9999
        },
      },
    })
  end
}
-- vim.cmd([[hi TelescopeNormal guibg=#31353f]])
-- vim.cmd([[hi TelescopeNormal guibg=#331D2C]])
-- vim.cmd([[hi TelescopeNormal guibg=#303841]])
-- vim.cmd([[hi TelescopeNormal guibg=#4C566A]])
-- vim.cmd([[hi TelescopeNormal guibg=#222831]])
-- vim.cmd([[hi TelescopeNormal guibg=#303841]])
--
-- vim.cmd([[hi TelescopePreviewNormal guibg=#302835]])
-- vim.cmd([[hi TelescopePreviewNormal guibg=#3F2E3E]])
-- vim.cmd([[hi TelescopePreviewNormal guibg=#3A4750]])
-- vim.cmd([[hi TelescopePreviewNormal guibg=#2E3440]])
-- vim.cmd([[hi TelescopePreviewNormal guibg=#393E46]])
-- vim.cmd([[hi TelescopePreviewNormal guibg=#393E46]])
-- vim.cmd([[hi TelescopePreviewNormal guibg=#475569]])
--
-- vim.cmd([[hi TelescopePromptNormal guibg=#3B4252]])
-- vim.cmd([[hi TelescopePromptNormal guibg=#475569]])
-- vim.cmd([[hi TelescopePromptNormal guibg=#FFD369]])
-- vim.cmd([[hi TelescopePromptNormal  guibg=#393f4a]])

-- mappings = {
--   i = {
--     -- map actions.which_key to <C-h> (default: <C-/>)
--     -- actions.which_key shows the mappings for your picker,
--     -- e.g. git_{create, delete, ...}_branch for the git_branches picker
--     -- ["<C-h>"] = "which_key"
--   },
--   -- n = {
--   --   ["<Leader>jp"] = require 'telescope'.builtin.jumplist,
--   --   ["<Leader>mk"] = require 'telescope'.builtin.marks
--   -- }
-- }
