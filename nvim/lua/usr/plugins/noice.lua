return {
  "folke/noice.nvim",
  -- event = "VimEnter",
  -- opt = true,

  config = function()
    require("noice").setup({
      -- presets = {
      --   command_palette = true
      -- },
      -- event = "VeryLazy",
      lsp = {
        hover = {
          enabled = false,
          silent = true
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      views = {
        mini = {
          position = {
            row = 0,
            col = "100%"
          }
        },
        split = {
          position = "right"
        },

        confirm = {
          border = {
            style = "none",
            padding = { 0, 0 }
          },
          position = {
            row = "0%",
            col = "50%"
          }
        },
        popup = {
          border = {
            style = "none",
            padding = { 0, 0 }
          },
          position = {
            row = "3%",
            col = "50%",
          },
        },
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 0, 0 }
            -- padding = { 1, 2 },
            -- padding = { 0, 1 },
          },
          position = {
            row = "0%",
            col = "50%",
          },
          size = {
            -- width = 75,
            width = 120,
            -- width = "100%",
            -- height = 999,
            height = 1
          },
          filter_options = {},
          -- win_options = {
          --   winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          -- },
        },
      },
      notify = {
        enabled = false
      },
      cmdline = {
        -- enabled = false,
        view = "cmdline_popup",
        -- view = "cmdline",
        format = {
          cmdline = false,
          search_up = false,
          search_down = false,
          lua = false,
          help = false,
        }
      },
      redirect = {
        view = "popup",
        filter = { event = "msg_show" },
      },
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        -- enabled = false,            -- enables the Noice messages UI
        view = "popup",         -- default view for messages
        view_error = "mini",    -- view for errors
        view_warn = "mini",     -- view for warnings
        view_history = "popup", -- view for :messages
        -- view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
        view_search = false,    -- view for search count messages. Set to `false` to disable
      },
      format = {
        level = {
          icons = {
            error = "✖",
            warn = "▼",
            info = "●",
          },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            -- find = "written",
          },
          view = "mini"
        },
      },

      popupmenu = {
        enabled = true,  -- enables the Noice popupmenu UI
        ---@type 'nui'|'cmp'
        backend = "nui", -- backend to use to show regular cmdline completions
        ---@type NoicePopupmenuItemKind|false
        -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        kind_icons = {}, -- set to `false` to disable icons
      },
      commands = {
        history = {
          -- options for the message history that you get with `:Noice`
          view = "popup",
          opts = { enter = true, format = "details" },
          filter = {
            any = {
              { event = "notify" },
              { error = true },
              { warning = true },
              { event = "msg_show", kind = { "" } },
              { event = "lsp",      kind = "message" },
            },
          },
        }
      }
    })
    require("telescope").load_extension("noice")
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}
