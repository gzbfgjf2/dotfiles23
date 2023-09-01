local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') ..
      '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local packer_sync = function()
  local packer_bootstrap = ensure_packer()
  if packer_bootstrap then
    require('packer').sync()
  end
end


ensure_packer()
local treesitter_ops = {
  "nvim-treesitter/nvim-treesitter",
  run = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
}


local nvim_surround_ops = {
  "kylechui/nvim-surround",
  -- Use for stability; omit to use `main` branch for the latest features
  tag = "*",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      keymaps = {
        visual = "<leader>s",
        visual_line = "<leader>S",
      },
    })
  end
}


local markdown_preview_ops = {
  "iamcco/markdown-preview.nvim",
  run = function() vim.fn["mkdp#util#install"]() end,
}


require("packer").startup(function(use)
  use { "catppuccin/nvim", as = "catppuccin" }
  use "wbthomason/packer.nvim"
  -- use "sonph/onehalf"
  use {
    "sonph/onehalf",
    rtp = "vim/",
    -- config = function() vim.cmd("colorscheme onehalfdark") end
  }
  use { "notomo/cmdbuf.nvim",
    config = function()
      vim.keymap.set("n", "q:", function()
        require("cmdbuf").vsplit_open()
      end)
      vim.keymap.set("c", "<C-f>", function()
        require("cmdbuf").vsplit_open()
        -- print(vim.keycode("<C-c>"))
        -- print(key)
        local key = vim.api.nvim_replace_termcodes("<C-c>", true, false, true)
        vim.api.nvim_feedkeys(key, "n", true)
      end)
      vim.api.nvim_create_autocmd({ "User" }, {
        group = vim.api.nvim_create_augroup("cmdbuf_setting", {}),
        pattern = { "CmdbufNew" },
        callback = function(args)
          vim.keymap.set("n", "q", [[<Cmd>quit<CR>]],
            { nowait = true, buffer = true })
          -- you can filter buffer lines
          -- local lines = vim.tbl_filter(function(line)
          --   return line ~= "q"
          -- end, vim.api.nvim_buf_get_lines(args.buf, 0, -1, false))
          -- vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, lines)
        end,
      })
    end
  }
  -- use { "lukas-reineke/virt-column.nvim",
  --   config = function()
  --     require('virt-column').setup({ char = '│' })
  --   end }
  use 'yorickpeterse/nvim-grey'
  use 'mbbill/undotree'
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use(treesitter_ops)
  use(nvim_surround_ops)
  use "nvim-neorg/neorg"
  -- use "vimjas/vim-python-pep8-indent"
  use "neovim/nvim-lspconfig"
  use "dag/vim-fish"
  use "lukas-reineke/indent-blankline.nvim"
  use {
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
  use { "sustech-data/wildfire.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("wildfire").setup()
    end,
  }
  use(markdown_preview_ops)
  -- use "kyazdani42/nvim-web-devicons"
  -- use("kyazdani42/nvim-tree.lua")
  -- use "tomasiser/vim-code-dark"
  -- use "joshdick/onedark.vim"
  -- use { "lervag/vimtex",
  --   config = function()
  --     vim.g.vimtex_fold_enabled = true
  --     vim.g.vimtex_syntax_enabled = 0
  --   end
  -- }
  use { "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim')
            .create_pre_hook(),
      }
    end,
  }
  use { "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup {
        -- style = 'dark',
        -- highlights = {
        --   IndentBlanklineIndent1 = { fg = "$red", guibg = "$yellow" },
        --   IndentBlanklineIndent2 = { fg = "$blue", guibg = "$green" },
        -- }
      }
    end,
  }
  use {
    'Verf/deepwhite.nvim',
    -- config = function()
    --   vim.cmd [[colorscheme deepwhite]]
    -- end,
  }
  use "tpope/vim-fugitive"
  -- use "qpkorr/vim-bufkill"
  -- use { 'ggandor/leap.nvim',
  --   config = function()
  --     require('leap').add_default_mappings()
  --   end, }
  use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }
  -- use 'junegunn/goyo.vim'
  -- use { 'lewis6991/gitsigns.nvim' }
  -- use 'folke/tokyonight.nvim'
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "onsails/lspkind.nvim"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "roobert/tailwindcss-colorizer-cmp.nvim"
  use "dmitmel/cmp-cmdline-history"
  use "hrsh7th/nvim-cmp"
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup(
        {
          float = {
            border = 'none'
          },
          preview = {
            border = 'solid',
            win_options = {
              winblend = 0,
            }
          }
        }
      )
    end
  }
  use { "windwp/nvim-ts-autotag", config = function()
    require('nvim-ts-autotag')
        .setup()
  end }
  -- use({
  --   "folke/noice.nvim",
  --   -- event = "VimEnter",
  --   -- opt = true,
  --
  --   config = function()
  --     require("noice").setup({
  --       -- presets = {
  --       --   command_palette = true
  --       -- },
  --       lsp = {
  --         hover = {
  --           enabled = false,
  --           silent = true
  --         },
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true,
  --         },
  --       },
  --       views = {
  --         split = {
  --           position = "right"
  --         },
  --
  --         confirm = {
  --           border = {
  --             style = "none",
  --             padding = { 0, 0 }
  --           },
  --           position = {
  --             row = "0%",
  --             col = "50%"
  --           }
  --         },
  --         popup = {
  --           border = {
  --             style = "none",
  --             padding = { 0, 0 }
  --           }
  --         },
  --         cmdline_popup = {
  --           border = {
  --             style = "none",
  --             padding = { 0, 0 }
  --             -- padding = { 1, 2 },
  --             -- padding = { 0, 1 },
  --           },
  --           position = {
  --             row = "0%",
  --             col = "50%",
  --           },
  --           size = {
  --             -- width = 75,
  --             width = 99,
  --             -- height = 999,
  --             height = 1,
  --           },
  --           filter_options = {},
  --           -- win_options = {
  --           --   winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
  --           -- },
  --         },
  --       },
  --       notify = {
  --         -- enabled = false
  --       },
  --       cmdline = {
  --         -- enabled = false,
  --         view = "cmdline_popup",
  --         format = {
  --           conceal = false,
  --           cmdline = { pattern = "", icon = "> ", lang = "vim" },
  --           search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
  --           search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
  --           lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "☾ ", lang = "lua" },
  --           help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
  --         }
  --       },
  --       redirect = {
  --         view = "popup",
  --         filter = { event = "msg_show" },
  --       },
  --       messages = {
  --         -- NOTE: If you enable messages, then the cmdline is enabled automatically.
  --         -- This is a current Neovim limitation.
  --         -- enabled = false,            -- enables the Noice messages UI
  --         view = "popup",            -- default view for messages
  --         view_error = "mini",       -- view for errors
  --         view_warn = "mini",        -- view for warnings
  --         view_history = "popup", -- view for :messages
  --         -- view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  --         view_search = false,       -- view for search count messages. Set to `false` to disable
  --       },
  --       format = {
  --         level = {
  --           icons = {
  --             error = "✖",
  --             warn = "▼",
  --             info = "●",
  --           },
  --         },
  --       },
  --       routes = {
  --         {
  --           filter = {
  --             event = "msg_show",
  --             kind = "",
  --             -- find = "written",
  --           },
  --           view = "mini"
  --         },
  --       },
  --
  --       popupmenu = {
  --         enabled = true,  -- enables the Noice popupmenu UI
  --         ---@type 'nui'|'cmp'
  --         backend = "nui", -- backend to use to show regular cmdline completions
  --         ---@type NoicePopupmenuItemKind|false
  --         -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
  --         kind_icons = {}, -- set to `false` to disable icons
  --       },
  --       commands = {
  --         history = {
  --           -- options for the message history that you get with `:Noice`
  --           view = "popup",
  --           opts = { enter = true, format = "details" },
  --           filter = {
  --             any = {
  --               { event = "notify" },
  --               { error = true },
  --               { warning = true },
  --               { event = "msg_show", kind = { "" } },
  --               { event = "lsp",      kind = "message" },
  --             },
  --           },
  --         }
  --       }
  --     })
  --     require("telescope").load_extension("noice")
  --   end,
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- })
  --
  use { "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          -- require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.diagnostics.eslint,
          -- require("null-ls").builtins.completion.spell,
          require("null-ls").builtins.formatting.black,
          require("null-ls").builtins.formatting.prettierd,
          -- require("null-ls").builtins.formatting.latexindent
        }
      })
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  -- use { 'echasnovski/mini.starter',
  --   config = function()
  --     local starter = require('mini.starter')
  --     require('mini.starter').setup({
  --       content_hooks = {
  --         --   starter.gen_hook.adding_bullet(""),
  --         starter.gen_hook.aligning("center", "center"),
  --       },
  --       -- evaluate_single = true,
  --       -- footer = os.date(),
  --       footer = "",
  --       header = "Let's go!",
  --       -- header = table.concat({
  --
  --         -- [[ ██▀███   █    ██  ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓]],
  --         -- [[▓██ ▒ ██▒ ██  ▓██▒ ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
  --         -- [[▓██ ░▄█ ▒▓██  ▒██░▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░]],
  --         -- [[▒██▀▀█▄  ▓▓█  ░██░▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ ]],
  --         -- [[░██▓ ▒██▒▒▒█████▓ ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒]],
  --         -- [[░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░]],
  --         -- [[  ░▒ ░ ▒░░░▒░ ░ ░ ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░]],
  --         -- [[  ░░   ░  ░░░ ░ ░    ░   ░ ░     ░░   ▒ ░░      ░   ]],
  --         -- [[   ░        ░              ░      ░   ░         ░   ]],
  --         -- [[                                 ░                  ]]
  --         -- [[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
  --         -- [[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
  --         -- [[/ /\  /  __/ (_) \ V /| | | | | | |]],
  --         -- [[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
  --         -- [[───────────────────────────────────]],
  --         -- [[                  __I__                                  ]],
  --         -- [[   .-'"  .  "'-.                                         ]],
  --         -- [[ .'  / . ' . \  '.                                       ]],
  --         -- [[/_.-..-..-..-..-._\ .---------------------------------.  ]],
  --         -- [[         #  _,,_   ( I hear it might rain people today ) ]],
  --         -- [[         #/`    `\ /'---------------------------------'  ]],
  --         -- [[         / / 6 6\ \                                      ]],
  --         -- [[         \/\  Y /\/       /\-/\                          ]],
  --         -- [[         #/ `'U` \       /a a  \               _         ]],
  --         -- [[       , (  \   | \     =\ Y  =/-~~~~~~-,_____/ )        ]],
  --         -- [[       |\|\_/#  \_/       '^--'          ______/         ]],
  --         -- [[       \/'.  \  /'\         \           /                ]],
  --         -- [[        \    /=\  /         ||  |---'\  \                ]],
  --         -- [[   jgs  /____)/____)       (_(__|   ((__|                ]],
  --       -- }, "\n"),
  --       query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
  --       -- items = {},
  --       -- starter.gen_hook.aligning("center", "center"),
  --       -- items = {
  --       --   { action = "tab G",      name = "G: Fugitive",       section = "Git" },
  --       --   { action = "PackerSync", name = "U: Update Plugins", section = "Plugins" },
  --       --   { action = "enew",       name = "E: New Buffer",     section = "Builtin actions" },
  --       --   { action = "qall!",      name = "Q: Quit Neovim",    section = "Builtin actions" },
  --       -- },
  --       -- items = {
  --       --   starter.sections.telescope(),
  --       -- }
  --     })
  --   end,
  -- }
  -- use { 'mhinz/vim-startify',
  --   config = function()
  --     -- let g:startify_custom_header =
  --     -- \ 'startify#center(startify#fortune#cowsay())'
  --     -- vim.cmd([[
  --     --   let g:startify_custom_header =
  --     --      \ 'startify#center(startify#fortune#cowsay())'
  --     --   let g:startify_lists = [
  --     --   \ { 'type': 'dir',       'header': startify#center(['MRU '.getcwd()]) },
  --     --   \ { 'type': 'sessions',  'header': startify#center(['Sessions']) },
  --     --   \ { 'type': 'files',     'header': startify#center(['MRU']) },
  --     --   \ { 'type': 'bookmarks', 'header': startify#center(['Bookmarks']) },
  --     --   \ { 'type': 'commands',  'header': startify#center(['Commands']) },
  --     --   \ ]
  --     --   let g:startify_left_padding = 1000 " Hard coded padding for lists
  --     --
  --     -- ]])
  --   end,
  -- }
  use 'ThePrimeagen/harpoon'
  -- use {
  -- use { 'declancm/cinnamon.nvim',
  --   config = function() require('cinnamon').setup() end
  -- }
  use {
    "folke/flash.nvim",
    config = function()
      require('flash').setup({
        label = { after = true, before = false },
        modes = { char = { enabled = false }
        }
      })
    end
    -- event = "VeryLazy",
    ---@type Flash.Config
    -- opts = {},
    -- stylua: ignore
    -- keys = {
    --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    --   { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    -- }}
  }

  packer_sync()
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/src/dotfiles/nvim/lua/usr/plugins/init.lua source <afile> | PackerCompile
  augroup end
]])
require("telescope").load_extension('harpoon')

-- vim.cmd[[colorscheme onedark]]
vim.g.vimtex_quickfix_ignore_filters = { 'Underfull', 'Overfull' }
-- require 'catppuccin'.setup({flavour="latte"})

-- require('gitsigns').setup()
-- use {
--   'VonHeikemen/fine-cmdline.nvim',
--   requires = {{'MunifTanjim/nui.nvim'}}
-- }
-- use {
--   "nvim-neorg/neorg",
--   ft = "norg",
--   config = function()
--     require('neorg').setup {
--       -- ... -- check out setup part...
--       load = {
--         ["core.defaults"] = {},
--         ["core.norg.concealer"] = {},
--         ["core.export.markdown"] = {}
--       }
--       --
--     }
--   end,
--   requires = "nvim-lua/plenary.nvim"
-- }

-- vim.cmd('source script/config.vim')
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
-- local language_servers = {} -- like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--     require('lspconfig')[ls].setup({
--         capabilities = capabilities,
--         other_fields = ...
--     })
-- end
vim.diagnostic.config({
  virtual_text = false,
  -- signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- vim.cmd [[
--   highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
--   highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
--   highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
--   highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold
--
--   sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
--   sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
--   sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
--   sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
-- ]]


--------
-- vanilla treesitter fold
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- -- vim.cmd([[set nofoldenable ]])
-- -- vim.opt.foldenable = false
-- vim.cmd([[autocmd BufReadPost, fileReadPost * normal zR]])
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     vim.cmd([[normal zR]])
--   end
-- })
---------

-- vim.o.updatetime = 250
-- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
-- require("neorg").setup({
-- 	-- ... -- check out setup part...
-- 	load = {
-- 		["core.defaults"] = {},
-- 		["core.norg.concealer"] = {},
-- 		["core.export"] = {},
-- 		["core.export.markdown"] = {},
-- 	},
-- })

-- require("null-ls").setup({
-- sources = {
-- require("null-ls").builtins.formatting.stylua,
-- require("null-ls").builtins.diagnostics.eslint,
-- require("null-ls").builtins.completion.spell,
-- require("null-ls").builtins.formatting.black,
-- require("null-ls").builtins.formatting.prettier,
-- require("null-ls").builtins.formatting.eslint_d,
-- },
-- })

require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "javascript", "python", "norg", "latex" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  indent = { enable = true },
  highlight = {
    -- `false` will disable the whole extension
    -- enable = true,
    enable = false,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust", "javascript" },
    disable = { "python", "javascript", "lua", "help" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  --  indent = {
  --    enable = true
  --  }
  context_commentstring = {
    enable = true,
    enable_autocmd = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})



-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

------ ident blankline
-- vim.cmd [[hi IndentBlanklineContextStart cterm=NONE ctermfg=white]]
-- vim.cmd [[hi IndentBlanklineChar         ctermfg=59]]
--
--
-- vim.opt.termguicolors = true
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=242 guibg=#35383d]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=245 guibg=#3d3e40]])

-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=bg guibg=bg]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=bg guibg=bg]])
-- vim.cmd([[highlight Visual gui=reverse]])
-- vim.cmd([[highlight IndentBlanklineChar guifg=#4b526e ]])
-- vim.cmd [[highlight Normal guibg=#131313]]
require("indent_blankline").setup({
  space_char_blankline = " ",
  show_current_context = false,
  -- show_current_context_space = true,
  -- show_current_context_start = false,
  -- show_first_indent_level = false,
  char = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  show_trailing_blankline_indent = false,
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
for _, keymap in pairs({
  'zo',
  'zO',
  'zc',
  'zC',
  'za',
  'zA',
  'zv',
  'zx',
  'zX',
  'zm',
  'zM',
  'zr',
  'zR',
}) do
  vim.api.nvim_set_keymap('n', keymap,
    keymap .. '<CMD>IndentBlanklineRefresh<CR>',
    { noremap = true, silent = true })
end
---------------

-- require("Comment").setup()

-- highlights
vim.cmd([[hi LineNr ctermfg=None]])
-- require("nvim-tree").setup({ -- BEGIN_DEFAULT_OPTS
-- 	auto_reload_on_write = true,
-- 	create_in_closed_folder = false,
-- 	disable_netrw = false,
-- 	hijack_cursor = false,
-- 	hijack_netrw = true,
-- 	hijack_unnamed_buffer_when_opening = false,
-- 	ignore_buffer_on_setup = false,
-- 	open_on_setup = false,
-- 	open_on_setup_file = false,
-- 	open_on_tab = false,
-- 	sort_by = "name",
-- 	update_cwd = false,
-- 	reload_on_bufenter = false,
-- 	respect_buf_cwd = false,
-- 	view = {
-- 		adaptive_size = false,
-- 		width = 30,
-- 		height = 30,
-- 		hide_root_folder = false,
-- 		side = "left",
-- 		preserve_window_proportions = false,
-- 		number = false,
-- 		relativenumber = false,
-- 		signcolumn = "yes",
-- 		mappings = {
-- 			custom_only = false,
-- 			list = {
-- 				-- user mappings go here
-- 			},
-- 		},
-- 	},
-- 	renderer = {
-- 		add_trailing = false,
-- 		group_empty = false,
-- 		highlight_git = false,
-- 		highlight_opened_files = "none",
-- 		root_folder_modifier = ":~",
-- 		indent_markers = {
-- 			enable = false,
-- 			icons = {
-- 				corner = "└ ",
-- 				edge = "│ ",
-- 				none = "  ",
-- 			},
-- 		},
-- 		icons = {
-- 			webdev_colors = true,
-- 			git_placement = "before",
-- 			padding = " ",
-- 			symlink_arrow = " ➛ ",
-- 			show = {
-- 				file = true,
-- 				folder = true,
-- 				folder_arrow = true,
-- 				git = true,
-- 			},
-- 			glyphs = {
-- 				default = "",
-- 				symlink = "",
-- 				folder = {
-- 					arrow_closed = "",
-- 					arrow_open = "",
-- 					default = "",
-- 					open = "",
-- 					empty = "",
-- 					empty_open = "",
-- 					symlink = "",
-- 					symlink_open = "",
-- 				},
-- 				git = {
-- 					unstaged = "✗",
-- 					staged = "✓",
-- 					unmerged = "",
-- 					renamed = "➜",
-- 					untracked = "★",
-- 					deleted = "",
-- 					ignored = "◌",
-- 				},
-- 			},
-- 		},
-- 		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
-- 	},
-- 	hijack_directories = {
-- 		enable = true,
-- 		auto_open = true,
-- 	},
-- 	update_focused_file = {
-- 		enable = false,
-- 		update_cwd = false,
-- 		ignore_list = {},
-- 	},
-- 	ignore_ft_on_setup = {},
-- 	system_open = {
-- 		cmd = "",
-- 		args = {},
-- 	},
-- 	diagnostics = {
-- 		enable = false,
-- 		show_on_dirs = false,
-- 		icons = {
-- 			hint = "",
-- 			info = "",
-- 			warning = "",
-- 			error = "",
-- 		},
-- 	},
-- 	filters = {
-- 		dotfiles = false,
-- 		custom = {},
-- 		exclude = {},
-- 	},
-- 	git = {
-- 		enable = true,
-- 		ignore = true,
-- 		timeout = 400,
-- 	},
-- 	actions = {
-- 		use_system_clipboard = true,
-- 		change_dir = {
-- 			enable = true,
-- 			global = false,
-- 			restrict_above_cwd = false,
-- 		},
-- 		expand_all = {
-- 			max_folder_discovery = 300,
-- 		},
-- 		open_file = {
-- 			quit_on_open = false,
-- 			resize_window = true,
-- 			window_picker = {
-- 				enable = true,
-- 				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
-- 				exclude = {
-- 					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
-- 					buftype = { "nofile", "terminal", "help" },
-- 				},
-- 			},
-- 		},
-- 		remove_file = {
-- 			close_window = true,
-- 		},
-- 	},
-- 	trash = {
-- 		cmd = "trash",
-- 		require_confirm = true,
-- 	},
-- 	live_filter = {
-- 		prefix = "[FILTER]: ",
-- 		always_show_folders = true,
-- 	},
-- 	log = {
-- 		enable = false,
-- 		truncate = false,
-- 		types = {
-- 			all = false,
-- 			config = false,
-- 			copy_paste = false,
-- 			diagnostics = false,
-- 			git = false,
-- 			profile = false,
-- 		},
-- 	},
-- }) -- END_DEFAULT_OPTS
--
--require("nvim-tree").setup{
--  update_focused_file = {
--    enable = true,
--  },
--  view = {
--    width = 30,
--    auto_resize = true,
--  },
--  renderer = {
--      icons = {
--          show = {
--              folder = false,
--              file = false,
--              git = false,
--              folder_arrow = false,
--          }
--      }
--  }
--}

-- local ivy = {
--   theme = "ivy",
--   hidden = true,
--   border = true,
--   -- borderchars = {"1", "2", "3", "4", "5", "6", "7", "8"},
--   prompt_title = "",
--   results_title = "",
--   preview_title = "",
--   prompt_prefix = "",
--   selection_caret = "",
--   entry_prefix = "",
--   multi_icon = "",
--   color_devicons = false,
--   preview = { msg_bg_fillchar = ' ' }
-- }
-- local dropdown = {
--   -- theme = "dropdown",
--   sorting_strategy = "ascending",
--   layout_strategy = "center",
--   hidden = false,
--   border = false,
--   -- borderchars = {"1", "2", "3", "4", "5", "6", "7", "8"},
--   prompt_title = "",
--   results_title = "",
--   preview_title = "",
--   prompt_prefix = "",
--   selection_caret = "",
--   entry_prefix = "",
--   multi_icon = "",
--   color_devicons = false,
--   preview = { msg_bg_fillchar = ' ' },
--   -- shorten_path = true,
--   layout_config = {
--     anchor = "N",
--     width = 99
--   }
-- }
require("telescope").setup({
  defaults = {
    -- theme = "dropdown",
    sorting_strategy = "ascending",
    layout_strategy = "center",
    -- hidden = false,
    hidden = true,
    border = false,
    -- borderchars = {"1", "2", "3", "4", "5", "6", "7", "8"},
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
      width = 99
    },
    --   layout_config = {
    --     anchor = "N"
    --   }
    -- -- }
    --   -- ...
    -- },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<C-h>"] = "which_key"
      }
    }
  },

  -- defaults = require('telescope.themes').get_dropdown {
  --   dropdown
  -- },
  pickers = {
    -- find_files = ivy,
    -- find_files = dropdown,
    find_files = {
      -- theme = "dropdown"
      -- hidden = true
    },
    -- buffers = dropdown,
    -- live_grep = dropdown,
    -- marks = dropdown,
  },
  -- extensions = {
  --   harpoon = {
  --     marks = dropdown,
  --   }
  -- },
  -- _extensions = {
  --   marks = dropdown,
  --   Marks = dropdown
  --   -- ...
  -- },
})
vim.keymap.set(
  'n',
  '<Leader>mk',
  function() require('telescope').extensions.harpoon.marks() end,
  { desc = 'harpoon marks' }
)


CallTelescope = function(input)
  local theme = require('telescope.themes').get_dropdown(dropdown)
  input(theme)
end
-- local vim = vim
-- local opt = vim.opt



-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/texlab.lua
local function on_list(options)
  vim.fn.setqflist({}, ' ', options)
  vim.api.nvim_command('cfirst')
end

local function on_list_lopen(options)
  vim.fn.setloclist(0, {}, ' ', options)
  vim.api.nvim_command('lopen')
end
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = false, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gd',
    function() vim.lsp.buf.definition { on_list = on_list } end, bufopts)
  -- vim.keymap.set('n', '<leader>gf',
  --   function() vim.lsp.buf.definition { on_list = on_list_lopen } end, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set("n", "<space>wl", function()
  -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gbr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f",
    function() vim.lsp.buf.format { async = true } end, bufopts)

  client.server_capabilities.semanticTokensProvider = nil
end

-- vim.fn.sign_define(
--   "LspDiagnosticsSignError",
--   { texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
-- )
-- vim.fn.sign_define(
--   "LspDiagnosticsSignWarning",
--   { texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
-- )
-- vim.fn.sign_define(
--   "LspDiagnosticsSignHint",
--   { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
-- )
-- vim.fn.sign_define(
--   "LspDiagnosticsSignInformation",
--   { texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
-- )

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- vim.opt.completeopt:remove({ "preview" })
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp
  .protocol.make_client_capabilities())

-- ufo
local zr_refresh = function()
  require("ufo").openAllFolds()
  require('indent_blankline').refresh()
end
local zm_refresh = function()
  require("ufo").closeAllFolds()
  require('indent_blankline').refresh()
end
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
vim.cmd([[autocmd BufReadPost, fileReadPost * normal zR]])
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zR", zr_refresh)
vim.keymap.set("n", "zM", zm_refresh)
require('ufo').setup()
--


require("lspconfig")["pyright"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

require("lspconfig")["tsserver"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,

})

require("lspconfig")["lua_ls"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      format = {
        enabled = true,
        defaultConfig = {
          max_line_length = "79"
        }
      },
      workspace = {
        checkThirdParty = false
      }
    }
  }
})

require 'lspconfig'.texlab.setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = { texlab = { latexFormatter = "none" } }
})

require 'lspconfig'.jsonls.setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
})

require 'lspconfig'.tailwindcss.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

-- vim.lsp.set_log_level("debug")


require 'usr.plugins.cmp'

-- vim.api.nvim_create_autocmd({"BufRead"}, {
-- callback = function() require'ufo'.closeAllFolds() end,
-- })
-- require('onedark').setup ({
--   style = 'light',
--   highlights = {
--     IndentBlanklineContextChar = { fg = "$light_grey", fmt = "nocombine" },
--     IndentBlanklineContextStart = { sp = "$light_grey", fmt = "nocombine,underline" },
--   }
-- })
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=242 guibg=#35383d]])
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=bg guibg=bg]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=245 guibg=#3d3e40]])
-- vim.cmd([[set background=light]])
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=bg guibg=bg]])
--
-- require 'onedark'.load()
-- vim.lsp.set_log_level("debug")

-- https://github.com/neovim/neovim/issues/20457#issuecomment-1266782345
vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
  config = config or {}
  config.focus_id = ctx.method
  if not (result and result.contents) then
    return
  end
  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result
    .contents)
  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
  if vim.tbl_isempty(markdown_lines) then
    return
  end
  return
end
