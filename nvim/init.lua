require "usr.options"

local lazy_opt = {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
}
local lazy = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=main",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup("usr.plugins", lazy_opt)
end

lazy()
-- require("notify").setup({
--   background_colour = "#000000",
-- })


vim.cmd([[hi TelescopeNormal guibg=#303841]])
vim.cmd([[hi TelescopePromptNormal guibg=#343434]])
vim.cmd([[hi TelescopePreviewNormal guibg=#475569]])
--
--
--
--
-- vim.cmd([[hi Normal guibg=None]])

-- vim.cmd([[hi NoiceCmdlinePopup guibg=#475569]])
-- vim.cmd([[hi TelescopeNormal guibg=#303841]])
-- vim.cmd([[hi TelescopePreviewNormal guibg=#393E46]])
-- vim.cmd([[hi TelescopePreviewNormal guibg=#475569]])
-- vim.cmd([[hi NoiceCmdlinePopup guibg=None]])

-- vim.cmd([[hi MsgArea guibg=#1E313B]])
-- vim.cmd([[hi MsgArea guibg=#1E293B]])
-- vim.cmd([[hi MsgArea guibg=#475569]])
-- vim.cmd([[hi link NoiceCmdlinePopup NormalFloat]])
-- vim.cmd([[hi NoiceCmdlinePopup guibg=]])
-- vim.cmd([[hi MsgArea guibg=white]])
-- vim.cmd([[hi NoiceCmdlinePopup guibg=white]])

-- require("luasnip.loaders.from_vscode").lazy_load()

-- vim.cmd [[colorscheme onedark]]
--
--local markdown_preview_ops = {
--  "iamcco/markdown-preview.nvim",
--  run = function() vim.fn["mkdp#util#install"]() end,
--}
--
--
--require("packer").startup(function(use)
--  use { "catppuccin/nvim", as = "catppuccin" }

--  use "wbthomason/packer.nvim"

--  -- use "sonph/onehalf"
--  use {
--    "sonph/onehalf",
--    rtp = "vim/",
--    -- config = function() vim.cmd("colorscheme onehalfdark") end
--  }

--  -- use { "lukas-reineke/virt-column.nvim",
--  --   config = function()
--  --     require('virt-column').setup({ char = '│' })
--  --   end }

--  use 'yorickpeterse/nvim-grey'


--  use { "sustech-data/wildfire.nvim",
--    dependencies = { "nvim-treesitter/nvim-treesitter" },
--    config = function()
--      require("wildfire").setup()
--    end,
--  }


--  -- use "kyazdani42/nvim-web-devicons"

--  -- use("kyazdani42/nvim-tree.lua")

--  -- use "tomasiser/vim-code-dark"

--  -- use "joshdick/onedark.vim"

--  use {
--    'Verf/deepwhite.nvim',
--    -- config = function()
--    --   vim.cmd [[colorscheme deepwhite]]
--    -- end,
--  }
--
--
--  -- use "qpkorr/vim-bufkill"
--
--  -- use { 'ggandor/leap.nvim',
--  --   config = function()
--  --     require('leap').add_default_mappings()
--  --   end, }
--
--  -- use 'junegunn/goyo.vim'
--
--  -- use { 'lewis6991/gitsigns.nvim' }
--
--  -- use 'folke/tokyonight.nvim'
--
--  -- use { 'echasnovski/mini.starter',
--  --   config = function()
--  --     local starter = require('mini.starter')
--  --     require('mini.starter').setup({
--  --       content_hooks = {
--  --         --   starter.gen_hook.adding_bullet(""),
--  --         starter.gen_hook.aligning("center", "center"),
--  --       },
--  --       -- evaluate_single = true,
--  --       -- footer = os.date(),
--  --       footer = "",
--  --       header = "Let's go!",
--  --       -- header = table.concat({
--  --
--  --         -- [[ ██▀███   █    ██  ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓]],
--  --         -- [[▓██ ▒ ██▒ ██  ▓██▒ ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
--  --         -- [[▓██ ░▄█ ▒▓██  ▒██░▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░]],
--  --         -- [[▒██▀▀█▄  ▓▓█  ░██░▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ ]],
--  --         -- [[░██▓ ▒██▒▒▒█████▓ ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒]],
--  --         -- [[░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░]],
--  --         -- [[  ░▒ ░ ▒░░░▒░ ░ ░ ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░]],
--  --         -- [[  ░░   ░  ░░░ ░ ░    ░   ░ ░     ░░   ▒ ░░      ░   ]],
--  --         -- [[   ░        ░              ░      ░   ░         ░   ]],
--  --         -- [[                                 ░                  ]]
--  --         -- [[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
--  --         -- [[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
--  --         -- [[/ /\  /  __/ (_) \ V /| | | | | | |]],
--  --         -- [[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
--  --         -- [[───────────────────────────────────]],
--  --         -- [[                  __I__                                  ]],
--  --         -- [[   .-'"  .  "'-.                                         ]],
--  --         -- [[ .'  / . ' . \  '.                                       ]],
--  --         -- [[/_.-..-..-..-..-._\ .---------------------------------.  ]],
--  --         -- [[         #  _,,_   ( I hear it might rain people today ) ]],
--  --         -- [[         #/`    `\ /'---------------------------------'  ]],
--  --         -- [[         / / 6 6\ \                                      ]],
--  --         -- [[         \/\  Y /\/       /\-/\                          ]],
--  --         -- [[         #/ `'U` \       /a a  \               _         ]],
--  --         -- [[       , (  \   | \     =\ Y  =/-~~~~~~-,_____/ )        ]],
--  --         -- [[       |\|\_/#  \_/       '^--'          ______/         ]],
--  --         -- [[       \/'.  \  /'\         \           /                ]],
--  --         -- [[        \    /=\  /         ||  |---'\  \                ]],
--  --         -- [[   jgs  /____)/____)       (_(__|   ((__|                ]],
--  --       -- }, "\n"),
--  --       query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
--  --       -- items = {},
--  --       -- starter.gen_hook.aligning("center", "center"),
--  --       -- items = {
--  --       --   { action = "tab G",      name = "G: Fugitive",       section = "Git" },
--  --       --   { action = "PackerSync", name = "U: Update Plugins", section = "Plugins" },
--  --       --   { action = "enew",       name = "E: New Buffer",     section = "Builtin actions" },
--  --       --   { action = "qall!",      name = "Q: Quit Neovim",    section = "Builtin actions" },
--  --       -- },
--  --       -- items = {
--  --       --   starter.sections.telescope(),
--  --       -- }
--  --     })
--  --   end,
--  -- }
--  -- use { 'mhinz/vim-startify',
--  --   config = function()
--  --     -- let g:startify_custom_header =
--  --     -- \ 'startify#center(startify#fortune#cowsay())'
--  --     -- vim.cmd([[
--  --     --   let g:startify_custom_header =
--  --     --      \ 'startify#center(startify#fortune#cowsay())'
--  --     --   let g:startify_lists = [
--  --     --   \ { 'type': 'dir',       'header': startify#center(['MRU '.getcwd()]) },
--  --     --   \ { 'type': 'sessions',  'header': startify#center(['Sessions']) },
--  --     --   \ { 'type': 'files',     'header': startify#center(['MRU']) },
--  --     --   \ { 'type': 'bookmarks', 'header': startify#center(['Bookmarks']) },
--  --     --   \ { 'type': 'commands',  'header': startify#center(['Commands']) },
--  --     --   \ ]
--  --     --   let g:startify_left_padding = 1000 " Hard coded padding for lists
--  --     --
--  --     -- ]])
--  --   end,
--  -- }
--  use 'ThePrimeagen/harpoon'
--  -- use {
--  -- use { 'declancm/cinnamon.nvim',
--  --   config = function() require('cinnamon').setup() end
--  -- }
--
--  packer_sync()
--end)
--
--vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost ~/src/dotfiles/nvim/lua/usr/plugins/init.lua source <afile> | PackerCompile
--  augroup end
--]])
--require("telescope").load_extension('harpoon')
--
---- vim.cmd[[colorscheme onedark]]
--vim.g.vimtex_quickfix_ignore_filters = { 'Underfull', 'Overfull' }
---- require 'catppuccin'.setup({flavour="latte"})
--
---- require('gitsigns').setup()
---- use {
----   'VonHeikemen/fine-cmdline.nvim',
----   requires = {{'MunifTanjim/nui.nvim'}}
---- }
---- use {
----   "nvim-neorg/neorg",
----   ft = "norg",
----   config = function()
----     require('neorg').setup {
----       -- ... -- check out setup part...
----       load = {
----         ["core.defaults"] = {},
----         ["core.norg.concealer"] = {},
----         ["core.export.markdown"] = {}
----       }
----       --
----     }
----   end,
----   requires = "nvim-lua/plenary.nvim"
---- }
--
---- vim.cmd('source script/config.vim')
---- local capabilities = vim.lsp.protocol.make_client_capabilities()
---- capabilities.textDocument.foldingRange = {
----     dynamicRegistration = false,
----     lineFoldingOnly = true
---- }
---- local language_servers = {} -- like {'gopls', 'clangd'}
---- for _, ls in ipairs(language_servers) do
----     require('lspconfig')[ls].setup({
----         capabilities = capabilities,
----         other_fields = ...
----     })
---- end
--vim.diagnostic.config({
--  virtual_text = false,
--  -- signs = false,
--  underline = true,
--  update_in_insert = false,
--  severity_sort = false,
--})
--
---- vim.cmd [[
----   highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
----   highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
----   highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
----   highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold
----
----   sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
----   sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
----   sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
----   sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
---- ]]
--
--
----------
---- vanilla treesitter fold
---- vim.opt.foldmethod = "expr"
---- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
---- -- vim.cmd([[set nofoldenable ]])
---- -- vim.opt.foldenable = false
---- vim.cmd([[autocmd BufReadPost, fileReadPost * normal zR]])
---- vim.api.nvim_create_autocmd("BufEnter", {
----   callback = function()
----     vim.cmd([[normal zR]])
----   end
---- })
-----------
--
---- vim.o.updatetime = 250
---- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
---- require("neorg").setup({
---- 	-- ... -- check out setup part...
---- 	load = {
---- 		["core.defaults"] = {},
---- 		["core.norg.concealer"] = {},
---- 		["core.export"] = {},
---- 		["core.export.markdown"] = {},
---- 	},
---- })
--
---- })
--
---- treesitter.setup()
--
--
---- vim.opt.list = true
---- vim.opt.listchars:append("space:⋅")
---- vim.opt.listchars:append("eol:↴")
--
-------- ident blankline
---- vim.cmd [[hi IndentBlanklineContextStart cterm=NONE ctermfg=white]]
---- vim.cmd [[hi IndentBlanklineChar         ctermfg=59]]
----
----
---- vim.opt.termguicolors = true
---- vim.cmd([[highlight IndentBlanklineIndent1 guifg=242 guibg=#35383d]])
---- vim.cmd([[highlight IndentBlanklineIndent2 guifg=245 guibg=#3d3e40]])
--
---- vim.cmd([[highlight IndentBlanklineIndent1 guifg=bg guibg=bg]])
---- vim.cmd([[highlight IndentBlanklineIndent2 guifg=bg guibg=bg]])
---- vim.cmd([[highlight Visual gui=reverse]])
---- vim.cmd([[highlight IndentBlanklineChar guifg=#4b526e ]])
---- vim.cmd [[highlight Normal guibg=#131313]]
-----------------
--
---- require("Comment").setup()
--
---- highlights
--vim.cmd([[hi LineNr ctermfg=None]])
--
--vim.keymap.set(
--  'n',
--  '<Leader>mk',
--  function() require('telescope').extensions.harpoon.marks() end,
--  { desc = 'harpoon marks' }
--)
--vim.keymap.set('n', '<Leader>jp',
--  function() require('telescope.builtin').jumplist() end)
--
--
--CallTelescope = function(input)
--  local theme = require('telescope.themes').get_dropdown(dropdown)
--  input(theme)
--end
---- local vim = vim
---- local opt = vim.opt
--
--
--
---- Mappings.
---- See `:help vim.diagnostic.*` for documentation on any of the below functions
--local opts = { noremap = true, silent = true }
--vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
--vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
--vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
---- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
--
---- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/texlab.lua
--local function on_list(options)
--  vim.fn.setqflist({}, ' ', options)
--  vim.api.nvim_command('cfirst')
--end
--
--local function on_list_lopen(options)
--  vim.fn.setloclist(0, {}, ' ', options)
--  vim.api.nvim_command('lopen')
--end
---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
--local on_attach = function(client, bufnr)
--  -- Enable completion triggered by <c-x><c-o>
--  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--
--  -- Mappings.
--  -- See `:help vim.lsp.*` for documentation on any of the below functions
--  local bufopts = { noremap = true, silent = false, buffer = bufnr }
--  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
--  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
--  vim.keymap.set('n', 'gd',
--    function() vim.lsp.buf.definition { on_list = on_list } end, bufopts)
--  -- vim.keymap.set('n', '<leader>gf',
--  --   function() vim.lsp.buf.definition { on_list = on_list_lopen } end, bufopts)
--  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
--  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
--  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
--  -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
--  -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
--  -- vim.keymap.set("n", "<space>wl", function()
--  -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--  -- end, bufopts)
--  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
--  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
--  -- vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
--  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
--  vim.keymap.set("n", "gbr", vim.lsp.buf.references, bufopts)
--  vim.keymap.set("n", "<space>f",
--    function() vim.lsp.buf.format { async = true } end, bufopts)
--
--  client.server_capabilities.semanticTokensProvider = nil
--end
--
---- vim.fn.sign_define(
----   "LspDiagnosticsSignError",
----   { texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
---- )
---- vim.fn.sign_define(
----   "LspDiagnosticsSignWarning",
----   { texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
---- )
---- vim.fn.sign_define(
----   "LspDiagnosticsSignHint",
----   { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
---- )
---- vim.fn.sign_define(
----   "LspDiagnosticsSignInformation",
----   { texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
---- )
--
--local lsp_flags = {
--  -- This is the default in Nvim 0.7+
--  debounce_text_changes = 150,
--}
--
---- vim.opt.completeopt:remove({ "preview" })
--local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp
--  .protocol.make_client_capabilities())
--
--
--
--require("lspconfig")["pyright"].setup {
--  on_attach = on_attach,
--  flags = lsp_flags,
--  capabilities = capabilities
--}
--
--require("lspconfig")["tsserver"].setup({
--  on_attach = on_attach,
--  flags = lsp_flags,
--  capabilities = capabilities,
--
--})
--
--require("lspconfig")["lua_ls"].setup({
--  on_attach = on_attach,
--  flags = lsp_flags,
--  capabilities = capabilities,
--  settings = {
--    Lua = {
--      diagnostics = {
--        globals = { 'vim' }
--      },
--      format = {
--        enabled = true,
--        defaultConfig = {
--          max_line_length = "79"
--        }
--      },
--      workspace = {
--        checkThirdParty = false
--      }
--    }
--  }
--})
--
--require 'lspconfig'.texlab.setup({
--  on_attach = on_attach,
--  flags = lsp_flags,
--  capabilities = capabilities,
--  settings = { texlab = { latexFormatter = "none" } }
--})
--
--require 'lspconfig'.jsonls.setup({
--  on_attach = on_attach,
--  flags = lsp_flags,
--  capabilities = capabilities
--})
--
--require 'lspconfig'.tailwindcss.setup {
--  on_attach = on_attach,
--  flags = lsp_flags,
--  capabilities = capabilities
--}
--
---- vim.lsp.set_log_level("debug")
--
--
--
---- vim.api.nvim_create_autocmd({"BufRead"}, {
---- callback = function() require'ufo'.closeAllFolds() end,
---- })
---- require('onedark').setup ({
----   style = 'light',
----   highlights = {
----     IndentBlanklineContextChar = { fg = "$light_grey", fmt = "nocombine" },
----     IndentBlanklineContextStart = { sp = "$light_grey", fmt = "nocombine,underline" },
----   }
---- })
---- vim.cmd([[highlight IndentBlanklineIndent1 guifg=242 guibg=#35383d]])
---- vim.cmd([[highlight IndentBlanklineIndent1 guifg=bg guibg=bg]])
---- vim.cmd([[highlight IndentBlanklineIndent2 guifg=245 guibg=#3d3e40]])
---- vim.cmd([[set background=light]])
---- vim.cmd([[highlight IndentBlanklineIndent1 guifg=bg guibg=bg]])
----
---- require 'onedark'.load()
---- vim.lsp.set_log_level("debug")
--
---- https://github.com/neovim/neovim/issues/20457#issuecomment-1266782345
--vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
--  config = config or {}
--  config.focus_id = ctx.method
--  if not (result and result.contents) then
--    return
--  end
--  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result
--    .contents)
--  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
--  if vim.tbl_isempty(markdown_lines) then
--    return
--  end
