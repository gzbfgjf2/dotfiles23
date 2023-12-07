return {
  -- enabled = false,
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local ls = require("null-ls")
    ls.setup({
      sources = {
        -- ls.builtins.diagnostics.eslint,
        -- ls.builtins.completion.spell,
        ls.builtins.formatting.black.with({
          extra_args = { "-l", "79" } }),
        -- ls.builtins.formatting.prettierd,
        ls.builtins.formatting.latexindent.with({
          extra_args = { "-m" },
          extra_filetypes = { "plaintex" }
        }),
        ls.builtins.formatting.prettier.with({
          extra_args = {
            "--write", "--prose-wrap", "always", "--print-width", "79"
          }
        }),
      }
    })
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
