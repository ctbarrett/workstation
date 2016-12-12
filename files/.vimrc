" Modeline {
"   vim: set tabstop=4 shiftwidth=4 softtabstop=4 expandtab foldmarker={,} foldmethod=marker:
" }

" Environment & initialization {

     " Basics {
        set nocompatible        " Must be first line
        set shell=/bin/bash
    " }

     " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
    " }

    " Support both Legacy Vim & NeoVim
    if has('nvim')
        let s:editor_root = expand("~/.config/nvim")
    else
        let s:editor_root = expand("~/.vim")
    endif

    " auto-install plugin manager
    let s:vp_path = s:editor_root . '/autoload/plug.vim'
    if !filereadable(s:vp_path)
        execute '!curl -fLo ' . s:vp_path . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif

" }

" NeoVim config {

    if has('nvim')
        let s:terminfo_patch = s:editor_root . '/patch-terminfo-for-vim-tmux-navigator.sh'
        " auto-patch terminfo so that ctrl-h works in neovim
        silent execute '!sh ' .  s:terminfo_patch

    endif

" }

" Basic settings {
    filetype plugin indent on           " Automatically detect file types.

    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')
            " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else
            " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    " Automatically switch to the current file directory when a new buffer is opened
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    " Setting up the directories {
        set backup                      " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif
    " }

    " Enable mouse support
    set mouse=a                         " Automatically enable mouse usage
    set mousehide                       " Hide the mouse cursor while typing

    " Enable per-file overrides
    set modeline

    set backspace=indent,eol,start      " Backspace for dummies
    set showmatch                       " Show matching brackets/parenthesis
    set incsearch                       " Find as you type search
    set hlsearch                        " Highlight search terms
    set ignorecase                      " Case insensitive search
    set smartcase                       " Case sensitive when uc present
    "set foldenable                      " Auto fold code

" }

" UI & appearance {

    " Themes & colors {
        colorscheme badwolf           " Load a colorscheme
        set background=dark             " Assume a dark background
        syntax on                       " Syntax highlighting

        " Allow to trigger background
        function! ToggleBG()
            let s:tbg = &background
            " Inversion
            if s:tbg == "dark"
                set background=light
            else
                set background=dark
            endif
        endfunction
        noremap <leader>bg :call ToggleBG()<CR>
    " }

    " Turn on line numbering
    set number
    set relativenumber

    " Show a vertical ruler in the 80th column
    set colorcolumn=80
    "highlight ColorColumn ctermbg=235 guibg=#2c2d27

    set linespace=0                     " No extra spaces between rows

    set tabpagemax=15                   " Only show 15 tabs
    set showmode                        " Display the current mode
    set cursorline                      " Highlight current line
    highlight clear SignColumn          " SignColumn should match background
    highlight clear LineNr              " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr        " Remove highlight color from current line number

    " Formatting {

        set nowrap                      " Do not wrap long lines
        set autoindent                  " Indent at the same level of the previous line
        set shiftwidth=4                " Use indents of 4 spaces
        set expandtab                   " Tabs are spaces, not tabs
        set tabstop=4                   " An indentation every four columns
        set softtabstop=4               " Let backspace delete indent
        set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
        set splitright                  " Puts new vsplit windows to the right of the current
        set splitbelow                  " Puts new split windows to the bottom of the current

        " Strip trailing whitespace on buffer save
        autocmd BufWritePre <buffer> call StripTrailingWhitespace()

    " }

" }

" Key (re)mappings {

    " Set leader to ',' instead of '\'
    let mapleader = ','

    " Easier horizontal scrolling
    map zl zL
    map zh zH

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

    " Normal mode {

        " Easier moving in tabs and windows
        nmap <C-J> <C-W>j<C-W>_
        nmap <C-K> <C-W>k<C-W>_
        nmap <C-L> <C-W>l<C-W>_
        nmap <C-H> <C-W>h<C-W>_

        " Wrapped lines goes down/up to next row, rather than next line in file.
        noremap j gj
        noremap k gk

        " Yank from the cursor to the end of the line, to be consistent with C and D.
        nnoremap Y y$

        " Toggle search highlighting rather than clear the current
        " search results.
        nmap <silent> <leader>/ :set invhlsearch<CR>

        " Map <Leader>ff to display all lines with keyword under cursor
        " and ask which one to jump to
        nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " }

    " Visual mode {

        " Visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv

        " Allow using the repeat operator with a visual selection (!)
        " http://stackoverflow.com/a/8064607/127816
        vnoremap . :normal .<CR>

    " }

    " Command mode {

        " Shortcuts
        " Change Working Directory to that of the current file
        cmap cwd lcd %:p:h
        cmap cd. lcd %:p:h

    " }

" }

" Plugins {
    call plug#begin()

        " NERDtree {
            " NERD tree will be loaded on the first invocation of NERDTreeToggle command
            Plug 'scrooloose/nerdtree'
            if isdirectory(expand(s:editor_root . "/plugged/nerdtree"))
                map <C-e> :NERDTreeToggle<CR>
                map <leader>e :NERDTreeToggle<CR>
                nmap <leader>nt :NERDTreeFind<CR>

                let NERDTreeShowBookmarks=1
                let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
                let NERDTreeChDirMode=0
                let NERDTreeQuitOnOpen=1
                let NERDTreeMouseMode=2
                let NERDTreeShowHidden=1
                let NERDTreeKeepTreeInNewTab=1
                let g:nerdtree_tabs_open_on_gui_startup=0
            endif
        " }

        " vim-colorschemes {
            Plug 'flazz/vim-colorschemes'
        " }

    call plug#end()
" }

" Functions {

    " Initialize directories {
    function! InitializeDirectories()
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = s:editor_root

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
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

    " Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }

" }

