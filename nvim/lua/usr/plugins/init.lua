local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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
        visual_line = "<leader>s",
      },
    })
  end
}


local markdown_preview_ops = {
  "iamcco/markdown-preview.nvim",
  run = function() vim.fn["mkdp#util#install"]() end,
}

-- vim.g.vimtex_view_method = "zathura"


require("packer").startup(function(use)
  use { "catppuccin/nvim", as = "catppuccin" }
  use "wbthomason/packer.nvim"
  -- use "sonph/onehalf"
  use {
    "sonph/onehalf",
    rtp = "vim/",
    -- config = function() vim.cmd("colorscheme onehalfdark") end
  }
  use 'yorickpeterse/nvim-grey'
  use 'mbbill/undotree'
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use(treesitter_ops)
  use(nvim_surround_ops)
  use "nvim-neorg/neorg"
  use "vimjas/vim-python-pep8-indent"
  use "neovim/nvim-lspconfig"
  use "dag/vim-fish"
  use "lukas-reineke/indent-blankline.nvim"
  use(markdown_preview_ops)
  -- use "kyazdani42/nvim-web-devicons"
  -- use("kyazdani42/nvim-tree.lua")
  -- use "tomasiser/vim-code-dark"
  -- use "joshdick/onedark.vim"
  use {"lervag/vimtex",
    config = function()
      vim.g.vimtex_fold_enabled = true
      vim.g.vimtex_syntax_enabled = 0
    end
  }
  use { "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
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
  use "tpope/vim-fugitive"
  -- use "qpkorr/vim-bufkill"
  -- use { 'ggandor/leap.nvim',
  --   config = function()
  --     require('leap').add_default_mappings()
  --   end, }
  -- use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }
  -- use 'junegunn/goyo.vim'
  -- use { 'lewis6991/gitsigns.nvim' }
  -- use 'folke/tokyonight.nvim'
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  -- use {
  --   "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {} end
  -- }
  use { "windwp/nvim-ts-autotag", config = function() require('nvim-ts-autotag').setup() end }
  use({
    "folke/noice.nvim",
    -- event = "VimEnter",
    -- opt = true,

    config = function()
      require("noice").setup({
        -- views = {
        --   cmdline_popup = {
        --     border = {
        --       style = "none",
        --       padding = { 1, 1 },
        --     },
        --     filter_options = {},
        --     win_options = {
        --       winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        --     },
        --   },
        -- },
        cmdline = {
          -- enabled = false,
          view = "cmdline",
          format = {
            -- conceal = false,
            cmdline = { pattern = "^:", icon = ":", lang = "vim" },
            -- search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
            -- search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
            -- cmdline = { pattern = "^:", icon = ":", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
          }
        },
        messages = {
          -- NOTE: If you enable messages, then the cmdline is enabled automatically.
          -- This is a current Neovim limitation.
          -- enabled = false,            -- enables the Noice messages UI
          view = "mini",             -- default view for messages
          view_error = "mini",       -- view for errors
          view_warn = "mini",        -- view for warnings
          view_history = "messages", -- view for :messages
          -- view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
          view_search = false,       -- view for search count messages. Set to `false` to disable
        }
      })
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })
  --
  use { "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          -- require("null-ls").builtins.formatting.stylua,
          -- require("null-ls").builtins.diagnostics.eslint,
          -- require("null-ls").builtins.completion.spell,
          require("null-ls").builtins.formatting.black,
          require("null-ls").builtins.formatting.prettierd
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
  -- use 'ThePrimeagen/harpoon'
  -- use {
  use {'declancm/cinnamon.nvim',
    config = function() require('cinnamon').setup() end
  }
  packer_sync()
end)

-- require("telescope").load_extension('harpoon')

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
-- require("ufo").setup({
--   provider_selector = function(bufnr, filetype, buftype)
--     return { "treesitter", "indent" }
--   end,
-- })
--
-- -- Option 2: nvim lsp as LSP client
-- -- Tell the server the capability of foldingRange,
-- -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
-- -- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- -- capabilities.textDocument.foldingRange = {
-- --     dynamicRegistration = false,
-- --     lineFoldingOnly = true
-- -- }
-- -- local language_servers = {} -- like {'gopls', 'clangd'}
-- -- for _, ls in ipairs(language_servers) do
-- --     require('lspconfig')[ls].setup({
-- --         capabilities = capabilities,
-- --         other_fields = ...
-- --     })
-- -- end
-- -- require('ufo').setup()
-- -- require( ufo ).peekFoldedLinesUnderCursor()
-- --
-- --
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
-- vim.o.foldcolumn = "0"
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

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
  ensure_installed = { "c", "lua", "javascript", "python", "norg" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

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
})

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

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
local ivy = {
  theme = "ivy",
  hidden = true,
  border = true,
  -- borderchars = {"1", "2", "3", "4", "5", "6", "7", "8"},
  prompt_title = "",
  results_title = "",
  preview_title = "",
  prompt_prefix = "",
  selection_caret = "",
  entry_prefix = "",
  multi_icon = "",
  color_devicons = false,
  preview = { msg_bg_fillchar = ' ' }
}
require("telescope").setup({
  defaults = {
    -- ...
  },
  pickers = {
    find_files = ivy,
    -- find_files = {
    --   theme = "dropdown"
    -- },
    buffers = ivy,
    live_grep = ivy,
    harpoon = ivy,
    marks = ivy,
  },
  extensions = {
    harpoon = ivy,
    Harpoon = ivy,
    marks = ivy,
    Marks = ivy
    -- ...
  },
})

local vim = vim
local opt = vim.opt



-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = false, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
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
  vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end, bufopts)

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

require("lspconfig")["pyright"].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require("lspconfig")["tsserver"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
})
require("lspconfig")["lua_ls"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
require 'lspconfig'.texlab.setup({
  on_attach = on_attach,
  flags = lsp_flags,
})
require 'lspconfig'.jsonls.setup({
  on_attach = on_attach,
  flags = lsp_flags,
})
-- vim.lsp.set_log_level("debug")
vim.opt.completeopt:remove({ "preview" })


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
