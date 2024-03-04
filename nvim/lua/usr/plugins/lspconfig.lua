local lsp_setup = function()
  vim.diagnostic.config({
    virtual_text = false,
    -- signs = false,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })
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
    vim.keymap.set('n', '<leader>gf',
      function() vim.lsp.buf.definition { on_list = on_list_lopen } end, bufopts)
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

  --  -- ufo
  --  local zr_refresh = function()
  --    require("ufo").openAllFolds()
  --    require('indent_blankline').refresh()
  --  end
  --  local zm_refresh = function()
  --    require("ufo").closeAllFolds()
  --    require('indent_blankline').refresh()
  --  end
  --  capabilities.textDocument.foldingRange = {
  --    dynamicRegistration = false,
  --    lineFoldingOnly = true
  --  }
  --  vim.cmd([[autocmd BufReadPost, fileReadPost * normal zR]])
  --  vim.o.foldcolumn = "0"
  --  vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  --  vim.o.foldlevelstart = 99
  --  vim.o.foldenable = true
  --  -- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  --  -- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  --  vim.keymap.set("n", "zR", zr_refresh)
  --  vim.keymap.set("n", "zM", zm_refresh)
  --  -- require('ufo').setup()
  --  --


  require("lspconfig")["pyright"].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  }

  require("lspconfig")["tsserver"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    --
  })
  require("lspconfig").eslint.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    --
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
    -- settings = { texlab = { latexFormatter = "none" } }
  })

  require 'lspconfig'.jsonls.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  })

  require 'lspconfig'.phpactor.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  })

  require 'lspconfig'.tailwindcss.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  }
  require 'lspconfig'.marksman.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  }

  -- vim.lsp.set_log_level("debug")
  --  require 'usr.plugins.cmp'
  --  require("luasnip.loaders.from_vscode").lazy_load()

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
end
return {
  "neovim/nvim-lspconfig",
  config = lsp_setup
}
