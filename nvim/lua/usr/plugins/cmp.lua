-- vim.cmd('set completeopt=menu,menuone,noselect')
-- Set up nvim-cmp.
local cmp = require 'cmp'
local lspkind = require 'lspkind'
local lsp_kind_format = lspkind.cmp_format {
  mode = "text",
  menu = {
    buffer = '[buf]',
    nvim_lsp = '[LSP]',
    nvim_lua = '[api]',
    path = '[path]',
    luasnip = "[snip]",
    cmdline = '[CMD]',
    history = '[His]'
  }
}

vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})

local import_luasnip, luasnip = pcall(require, 'luasnip')
if not import_luasnip then return end
local t = vim.api.nvim_replace_termcodes
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer', keyword_length = 5 },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'cmdline' },
--     { name = 'cmdline_history' },
--     { name = 'path' },
--   })
-- })
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- ["<C-n>"] = cmp.mapping({
    --   c = function()
    --     if cmp.visible() then
    --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    --     else
    --       vim.api.nvim_feedkeys(t("<C-n>"), "c", true)
    --     end
    --   end,
    --   i = function(fallback)
    --     if cmp.visible() then
    --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    --     else
    --       fallback()
    --     end
    --   end,
    -- }),
    -- ["<C-p>"] = cmp.mapping({
    --   c = function()
    --     if cmp.visible() then
    --       cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
    --     else
    --       vim.api.nvim_feedkeys(t("<C-p>"), "c", true)
    --     end
    --   end,
    --   i = function(fallback)
    --     if cmp.visible() then
    --       cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
    --     else
    --       fallback()
    --     end
    --   end,
    -- }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      entry_filter = function(entry, ctx)
        return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
      end
    },
    { name = 'nvim_lua' },
    { name = 'path' },

    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    -- }, {
    -- { name = 'buffer' },
  }),
  experimental = {
    native_menu = false,
    -- ghost_text = true
  },
  formatting = {
    format = function(entry, item)
      lsp_kind_format(entry, item)
      item.abbr = vim.fn.strcharpart(item.abbr, 0, 99)

      return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    end
  },
})


-- Set up lspconfig.
-- vim.opt.completeopt:remove({ "preview" })
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['tsserver'].setup {
--   capabilities = capabilities
-- }
-- require('lspconfig')['pyright'].setup {
--   capabilities = capabilities
-- }
