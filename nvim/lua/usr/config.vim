" M means moved to lua
" otherwise is commented out before


" this variasoble must be enabled for colors to be applied properly
" M set termguicolors 

"automatically install vim-plug
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

"plug
"call plug#begin()
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'beeender/Comrade'
" Plug 'deoplete-plugins/deoplete-jedi'
" Use release branch (recommend)
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'sbdchd/neoformat'
" Plug 'chriskempson/tomorrow-theme'
" Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'junegunn/goyo.vim'
" Plug 'VonHeikemen/fine-cmdline.nvim'
" Plug 'MunifTanjim/nui.nvim'
" Plug 'davepinto/virtual-column.nvim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'arzg/vim-colors-xcode'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'tomasiser/vim-code-dark'
" Plug 'ayu-theme/ayu-vim'
" Plug 'numToStr/Comment.nvim'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
" Plug 'qpkorr/vim-bufkill'
" Plug 'lukas-reineke/virt-column.nvim'
" Plug 'ggandor/leap.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 
" Plug 'nvim-neorg/neorg' | Plug 'nvim-lua/plenary.nvim'
"call plug#end()
"lua require('config')

"let g:airline#extensions#tabline#enabled = 1
"let g:deoplete#enable_at_startup=1
"let g:deoplete#auto_complete=1
" let ayucolor="dark"
" colorscheme onedark
" let mapleader = "\<BS>"
" nnoremap <SPACE> <Nop>
" let mapleader = " "
" nnoremap <backspace> <nop>
" map <backspace> <nop>
" map! <backspace> <nop>
" hi VertSplit ctermbg=white ctermfg=white
" hi VertSplit cterm=None ctermfg=None ctermbg=None guibg=None
" hi VertSplit guifg=#2c323c guibg=None
" hi VertSplit gui=reverse guibg=bg guifg=fg
" hi VertSplit guifg=fg
" hi StatusLineNC guifg=#ABB2BF guibg=#2c323c
" hi StatusLineNC guifg=#5c6370 guibg=#2c323c
" hi StatusLine guibg=240 guibg=grey
" hi StatusLine gui=inverse
" hi StatusLineNC gui=inverse guibg=bg guifg=fg
" hi msgArea guibg=#2C323C
" hi StatusLineNC guibg=#2C323C
" hi msgArea guibg=#21262d
" hi msgArea guibg=black

" M hi StatusLineNC guibg=bg
" M hi StatusLine guibg=bg
" set inccommand=
" M set cmdheight=0
" M set laststatus=0
" set noincsearch

" M hi Comment gui=None
" hi Normal guibg=#1E1E1E
" hi Normal guibg=#1d1f21
" hi NonText guifg=LightBlue guibg=grey20
" hi FgCocErrorFloatBgCocFloating ctermfg=0 ctermbg=13 
" hi FgCocHintFloatBgCocFloating ctermfg=0 ctermbg=13
" M syntax on
" https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
" M filetype plugin indent on
" M set tabstop=4
" when indenting with '>', use 4 spaces width
" M set shiftwidth=4
" On pressing tab, insert 4 spaces
" set guioptions-=m "menu bar
" set guioptions-=T "toobar
" set guioptions-=r "scrollbar
" M set expandtab
" M set autoindent
" set number
" set backspace=indent,eol,start
" set display-=msgsep
" set relativenumber
" M set splitright
" M set signcolumn=no
"set background=light
"set cursorline

"keymaps
" map j <Left>
" map k <Down>
" map l <Up>
" map ; <Right>
" nnoremap h ;

" nnoremap <space> :
" M nnoremap <Leader>ecfv :e ~/.config/nvim/plugin/config.vim<Enter>
" M nnoremap <Leader>scfv :so ~/.config/nvim/plugin/config.vim<Enter>
" M nnoremap <Leader>einl :e ~/.config/nvim/init.lua<Enter>
" M nnoremap <Leader>eluf :e ~/.config/nvim/lua/usr<Enter>
" M nnoremap <Leader>sinl :luafile ~/.config/nvim/init.lua<Enter>
" M nnoremap <Leader>ealy :e ~/.config/alacritty/alacritty.yml<Enter>
" M nnoremap <Leader>etdt :e ~/.todo/todo.txt<Enter>
" M nnoremap <Leader>ecff :e ~/.config/fish/config.fish<Enter>
" M tnoremap <Esc> <C-\><C-n>
" M nnoremap <Leader>i dd<up>o

"command
":command configure :vs $MYVIMRC<Enter>
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"indent guide
"hi IndentGuidesOdd  ctermbg=grey
"hi IndentGuidesEven ctermbg=darkgrey
"let g:indent_guides_start_level = 1
"let g:indent_guides_guide_size = 4
"let g:indent_guides_enable_on_vim_startup = 1

"
" set fillchars=vert:\ 
" set fillchars=eob:\ 

"autocmd filetype python highlight IndentBlanklineContextStart cterm=None
"set foldmethod=expr
"set nofoldenable
"set foldexpr=nvim_treesitter#foldexpr()
" vimrc
" nnoremap <leader><C-n>f :NvimTreeFocus<CR>
" nnoremap <leader><C-n>c :NvimTreeClose<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

" hi Specialkey guifg= SteelBlue1
" M hi Specialkey guifg= fg
" hi NonText guifg = SteelBlue1
" a list of groups can be found at `:help nvim_tree_highlight`
"highlight NvimTreeFolderIcon guibg=blue
"function! DisableST()
"  return " "
"endfunction
"au BufEnter NvimTree setlocal statusline=%!DisableST()
" :command -nargs=
" M autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" M autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab
" autocmd FileType python map <buffer> <leader>wr :w<CR>:vert term python "%"<CR>
" autocmd FileType vim map <buffer> <leader>ws :w<CR>:source %<CR>
" let g:indent_blankline_show_first_indent_level = v:true

" M augroup Python
" M     autocmd!
" M     autocmd FileType python map <buffer> <leader>wr :w<CR>:vert term python "%"<CR>
" M     autocmd FileType python set tw=79
" M augroup END

" M set tw=79
" set colorcolumn=+1
" autocmd CmdlineEnter * execute 'normal! "\<C-e>"' | redraw
" autocmd CmdlineEnter * execute 'normal! "\<C-y>"' | redraw
" autocmd CmdlineEnter * redraw
" autocmd CmdlineEnter * execute 'normal! "\<C-y>"' | redraw
" set iskeyword+=-
" set noshowmode
" augroup SmartNumberGroup
"     autocmd!
"     autocmd CmdLineEnter * set norelativenumber | normal <C-y> | redraw
"     autocmd CmdLineLeave * set relativenumber
" augroup END

" https://www.reddit.com/r/neovim/comments/vemydn/my_command_for_full_screen_interactive_terminal/
" u/funbike
" M command! -nargs=? Terminal call s:Term(<q-args>)
" M function! s:Term(args)
" M   if has('nvim')
" M     " tabnew
" M     execute 'terminal ' . a:args
" M     " execute 'terminal'
" M     " execute a:args
" M     " no left gutter
" M     setlocal signcolumn=no
" M     setlocal norelativenumber
" M     setlocal nonumber
" M     " if no errors, auto-close
" M     " autocmd! TermClose <buffer=abuf> if !v:event.status | exec 'bd! '..expand('<abuf>') | endif | checktime
" M     startinsert
" M   elseif has('terminal')
" M     execute 'tab terminal ++close ' . a:args
" M   else
" M     execute 'silent !( ' . (a:args != '' ? a:args : $SHELL) . ') || ( echo "Hit Enter"; read; )' | redraw!
" M   endif
" M endfunction
" M func Eatchar(pat)
" M   let c = nr2char(getchar(0))
" M   return (c =~ a:pat) ? '' : c
" M endfunc
" cabbrev h vert h \<<C-R>=Eatchar('\s')<CR>
" M cabbrev h vert h<C-R>=Eatchar('\s')<CR> 

" iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>
" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" :set wildmode=longest:full,full

" hi VirtColumn guifg=#2C323C guibg=bg
" fold
" Find files using Telescope command-line sugar.
" M nnoremap <leader>ff <cmd>Telescope find_files<cr>
" M nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" M nnoremap <leader>fb <cmd>Telescope buffers<cr>
" M nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" set foldnestmax=3
"
" set foldminline=1


" https://www.reddit.com/r/neovim/comments/632wh4/neovim_does_not_save_last_cursor_position/
" justinmk
" ·
" 5 yr. ago
" Neovim core
" For example, in vim, if I exit a file with the current line at 20, the next time I open the same file the cursor is at line 20.
"
" Vim (and Nvim) doesn't do that by default, it requires an autocmd, like this:
"
" autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 
" That works for me in nvim. See also :help last-position-jump.
" M autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
" sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
" sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
" sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=
