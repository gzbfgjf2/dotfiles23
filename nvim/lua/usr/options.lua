-- options
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cmdheight = 0
vim.o.laststatus = 0
vim.o.syntax = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.splitright = true
vim.o.signcolumn = "no"
-- vim.o.tw = 79
vim.o.nuw = 1
vim.o.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
-- vim.o.guicursor= "v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.foldopen:remove({ "block" })
vim.o.so=999
vim.o.ve="onemore"

-- vim.opt.fillchars = {
-- eob = " ",
-- fold = " ",
-- stl = " ",

-- }

-- cmd
vim.cmd 'filetype plugin indent on'


--create cmd
-- https://www.reddit.com/r/neovim/comments/vemydn/my_command_for_full_screen_interactive_terminal/u/funbike
vim.cmd([[
  command! -nargs=? Terminal call Term(<q-args>)
]])
vim.cmd([[
  cabbrev h vert h<C-R>=Eatchar('\s')<CR> 
]])


-- create functions
vim.cmd([[
  function! Term(args)
    if has('nvim')
      " tabnew
      execute 'terminal ' . a:args
      " execute 'terminal'
      " execute a:args
      " no left gutter
      setlocal signcolumn=no
      setlocal norelativenumber
      setlocal nonumber
      " if no errors, auto-close
      " autocmd! TermClose <buffer=abuf> if !v:event.status | exec 'bd! '..expand('<abuf>') | endif | checktime
      startinsert
    elseif has('terminal')
      execute 'tab terminal ++close ' . a:args
    else
      execute 'silent !( ' . (a:args != '' ? a:args : $SHELL) . ') || ( echo "Hit Enter"; read; )' | redraw!
    endif
  endfunction
]])
vim.cmd([[
  func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
  endfunc
]])


-- autocmd
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "html", "css" },
  command = "setlocal shiftwidth=2 tabstop=2",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml" },
  command = "setlocal ts=2 sts=2 sw=2 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  command = "setlocal ts=2 sts=2 sw=2 expandtab",
})
vim.cmd([[
  augroup Python
    autocmd!
    autocmd FileType python map <buffer> <leader>wr :w<CR>:vert term python "%"<CR>
    autocmd FileType python set tw=79
  augroup END
]])
vim.cmd([[
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"zz" | endif
]])
-- vim.cmd[[:nnoremap <silent> <CR> :nohlsearch<CR><CR>]]
vim.cmd[[autocmd InsertLeave * :normal `^]]

-- keymaps
vim.keymap.set('n', '<BS>', ':', { noremap = true })
vim.keymap.set('n', "<Leader>ecfv", ":e ~/.config/nvim/plugin/config.vim<Enter>", { noremap = true })
vim.keymap.set('n', "<Leader>scfv", ":so ~/.config/nvim/plugin/config.vim<Enter>", { noremap = true })
vim.keymap.set('n', "<Leader>einl", ":e ~/.config/nvim/init.lua<Enter>", { noremap = true })
vim.keymap.set('n', "<Leader>eluf", ":e ~/.config/nvim/lua/usr<Enter>", { noremap = true })
vim.keymap.set('n', "<Leader>sinl", ":luafile ~/.config/nvim/init.lua<Enter>", { noremap = true })
vim.keymap.set('n', "<Leader>ealy", ":e ~/.config/alacritty/alacritty.yml<Enter>", { noremap = true })
vim.keymap.set('n', "<Leader>etdt", ":e ~/.todo/todo.txt<Enter>", { noremap = true })
vim.keymap.set('n', "<Leader>ecff", ":e ~/.config/fish/config.fish<Enter>", { noremap = true })
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set('n', "<Leader>i", "dd<up>o", { noremap = true })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })
-- vim.keymap.set("n", "<c-d>", "<c-d>zz0", { noremap = true })
-- vim.keymap.set("n", "<c-u>", "<c-u>zz0", { noremap = true })
-- vim.keymap.set("n", "<c-f>", "<c-f>zz0", { noremap = true })
-- vim.keymap.set("n", "<c-b>", "<c-b>zz0", { noremap = true })
vim.keymap.set("n", "<c-d>", "<c-d>0", { noremap = true })
vim.keymap.set("n", "<c-u>", "<c-u>0", { noremap = true })
vim.keymap.set("n", "<c-f>", "<c-f>0", { noremap = true })
vim.keymap.set("n", "<c-b>", "<c-b>0", { noremap = true })
-- vim.keymap.set("n", "h", "hzz", { noremap = true })
-- vim.keymap.set("n", "j", "jzz", { noremap = true })
-- vim.keymap.set("n", "k", "kzz", { noremap = true })
-- vim.keymap.set("n", "l", "lzz", { noremap = true })
-- vim.keymap.set("n", "G", "Gzz", { noremap = true })
-- vim.cmd(' let mapleader = \"\\<BS>\" ')
-- vim.g.mapleader = vim.api.nvim_replace_termcodes('<BS>', true, false, true)
-- vim.g.mapleader = "<80>kb"
-- vim.g.mapleader = "<>"
-- vim.keymap.set('n', '<BS>', '<nop>', {noremap=true})


-- hightlight
-- vim.api.nvim_set_hl(0, 'StatusLine', { bg = "bg" })
-- vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = "bg" })
-- vim.api.nvim_set_hl(0, 'SpecialKey', { fg = "fg" })
-- vim.api.nvim_set_hl(0, 'Comment', { gui = false })
-- vim.api.nvim_set_hl(0, 'Error', { fg = "#ffffff", undercurl = true })
-- vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
vim.api.nvim_set_hl(0, 'EndofBuffer', { fg = "#5c6370" })
