return {
  "notomo/cmdbuf.nvim",
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
