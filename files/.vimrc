" Basics {
  set nocompatible    " Must be the first line
  set nomodeline      " Ignore modelines
  set shell=/bin/bash

  set history=1000  " Store a ton of history (default is 20)
  set spell         " Spell checking on
  set hidden        " Allow buffer switching without saving
  set iskeyword-=.  " '.' is an end of word designator
  set iskeyword-=#  " '#' is an end of word designator
  set iskeyword-=-  " '-' is an end of word designator

  set backspace=indent,eol,start  " Backspace for dummies
  set showmatch                   " Show matching brackets/parenthesis
  set incsearch                   " Find as you type search
  set hlsearch                    " Highlight search terms
  set ignorecase                  " Case insensitive search
  set smartcase                   " Case sensitive when uc present
  set foldenable                  " Auto fold code

  set backup                " Backups are nice ...
  if has('persistent_undo')
    set undofile            " So is persistent undo ...
    set undolevels=1000     " Maximum number of changes that can be undone
    set undoreload=10000    " Maximum number lines to save for undo on a buffer reload
  endif

  filetype plugin indent on " Automatically detect file types.
  scriptencoding utf-8

  let loaded_netrwPlugin=1  " Disable netrw

" }

" Load Plugins {
  if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
  endif
" }

" General {
  " Override leader to use the space bar
  map <space> <leader>

  " Use system clipboard {
    if has('clipboard')
      if has('unnamedplus')
        " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
      else
        " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
      endif
    endif
  " }

  " Add support for 'paste mode', which allows you to mass paste text without it
  " getting munged.
  set pastetoggle=<F2>

  " Automatically switch to the current file directory when a new buffer is opened
  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" }

" Vim UI {

  " GUI Options {
    if has('gui_running')
      set macligatures
      set guioptions-=rL
      set guifont=Fira\ Code:h12
    endif
  " }

  " Enable truecolor terminal {
    if &term == 'xterm-256color'
      set t_Co=256
      set termguicolors
    endif
  " }

  " Setup themes {
    " Enable syntax highlighting
    syntax on

    " Set dark & light theme
    let cb_theme = {
          \ 'dark': { 'vim': 'solarized8_dark_high', 'airline': 'solarized' },
          \ 'light': { 'vim': 'solarized8_light_high', 'airline': 'solarized' }
          \ }
  " }

  " Mouse config {
    if has('mouse')
      set mouse=a
      if &term =~ "xterm" || &term =~ "screen"
        let s:tm='xterm2'
      endif
      if has("mouse_sgr")
        let s:tm='sgr'
      endif
      exe 'set ttymouse=' . s:tm
      " and prevent from getting reset
      " exe 'autocmd VimEnter,FocusGained,BufEnter * set ttymouse=' . s:tm
    endif
  " }

  " Formatting {
    set nowrap                  " Do not wrap long lines
    set textwidth=120           " Set a vertical wrap guide and auto-wrap words. 120 is the default for Markdown pages rendered on Github, which seems to be a good default for most other things, as well
    let &colorcolumn=&textwidth
    set nojoinspaces            " Prevents inserting two spaces after punctuation on a join (J)

    set autoindent              " Indent at the same level of the previous line
    set tabstop=4               " An indentation every four columns
    set shiftwidth=4            " Use indents of 4 spaces
    set softtabstop=4           " Let backspace delete indent
    set expandtab               " Tabs are spaces, not tabs

    autocmd Syntax * normal zR  " start out files with all folds opened
  " }

  " Windows and splits {
    " Open new splits to the right and below
    set splitright  " Puts new vsplit windows to the right of the current
    set splitbelow  " Puts new split windows to the bottom of the current

    " customize vertical window borders
    set fillchars+=vert:│
    hi VertSplit cterm=NONE

    " Line numbers
    set number
    set relativenumber
    highlight clear SignColumn  " SignColumn should match background
    highlight clear LineNr      " Current line number row will have same background color in relative mode
  " }

" }

" Key (re)mappings {
  " Quickly edit/reload the vimrc file
  nmap <silent> <leader>ev :e ~/.vimrc<CR>
  nmap <silent> <leader>sv :so ~/.vimrc<CR>

  " Change Working Directory to that of the current file
  cmap cwd lcd %:p:h
  cmap cd. lcd %:p:h

  " remap up and down so that they don't jump past wrapped lines
  nnoremap j gj
  nnoremap k gk

  " Stupid shift key fixes
  if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
  endif
  cmap Tabe tabe

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " Toggle light/dark background
  noremap <leader>bg :call ToggleBG()<CR>

  " Easy window navigation
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  map <C-\> <C-w>\

  " Easy tab navigation
  map <C-t> :tabnext<CR>
  map <C-T> :tabprev<CR>

  " Easy window resizing
  " Vertical
  nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
  nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
  nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
  nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
  " Horizontal
  nnoremap <silent> <Leader>] :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
  nnoremap <silent> <Leader>[ :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

  " Toggle line numbers and signs column (<leader>l)
  nmap <silent> <leader>l :set invnumber invrelativenumber<CR>:SignifyToggle<CR>

  " Toggle search highlighting rather than clear the current search results.
  nmap <silent> <leader>/ :set invhlsearch<CR>

  " Toggle NERDTree pane
  nnoremap <C-e> :NERDTreeToggle<CR>

  " Launch a terminal split
  map <Leader>vsh :execute 'ConqueTermVSplit ' . &shell<CR>
  map <Leader>sh :execute 'ConqueTermSplit ' . &shell<CR>

  " Toggle indent markers
  nmap <silent> <leader>ig :IndentLinesToggle<CR>:SignifyToggle<CR>

" }

" Plugin settings {

  " ack.vim {
    " use ag with vim-ack
    if executable('ag')
      let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
    endif
  " }

  " Conque-Shell {
    " Use <Esc> for shell vi-mode, and <Leader><Esc> for getting back to normal mode in vim
    let g:ConqueTerm_EscKey='<Esc><Esc>'
    "
    " Disable vertical wrap guide & trailing space marker
    autocmd FileType conque_term setlocal colorcolumn=0
    autocmd FileType conque_term setlocal listchars=
  " }

  " gruvbox {
    let g:gruvbox_italic=1
    let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_contrast_light='hard'
  " }

  " indentline {
    " customize indent lines
    " let g:indent_guides_enable_on_vim_startup = 0
    let g:indentLine_enabled = 1
    let g:indentLine_char = '│'
  " }

  " vim-airline {
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
  " }

" }

" Functions {
  " Make it purdy! {
    function! SetBG(shade)
      exe 'colorscheme ' . g:cb_theme[a:shade]['vim']
      highlight Comment cterm=italic
      highlight VertSplit cterm=NONE

      let g:airline_theme = g:cb_theme[a:shade]['airline']
    endfunction

    " Toggle default light/dark background settings
    function! ToggleBG()
      let s:tbg = &background
      let &background = ( &background == "dark"? "light" : "dark" )
      call SetBG(&background)
      AirlineRefresh
    endfunction
  " }

  " Strip whitespace {
  function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endfunction
  " }
" }

" Initializations {
  call SetBG('dark')
" }
