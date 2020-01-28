" START CONFIG FOR VUNDLE
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" theme plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'

" search plugins
Plugin 'mileszs/ack.vim'

" code view
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'

" code completion
Plugin 'jiangmiao/auto-pairs'
" Plugin 'scrooloose/nerdcommenter'
if has('lua')
    Plugin 'Shougo/neocomplete.vim'
    Plugin 'Shougo/neosnippet'
    Plugin 'Shougo/neosnippet-snippets'
endif

" syntax checking
Plugin 'scrooloose/syntastic'

" git plugins
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'

" C/C++ language plugins
Plugin 'vim-scripts/a.vim'

" Go language plugins
Plugin 'fatih/vim-go'

" markdown syntax highlight
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'

" vue plugins
Plugin 'posva/vim-vue'

call vundle#end()
" END CONFIG FOR VUNDLE


filetype on
filetype plugin on
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

autocmd BufNewFile,BufRead *.vue set filetype=vue
autocmd FileType coffee,html,css,xml,yaml,json,javascript,vue setlocal ts=2 sw=2 sts=2
set magic
set autoindent
set smartindent
set backspace=indent,eol,start
set nocompatible
set wildmenu
set completeopt-=preview

set foldenable
set foldcolumn=0
" set foldmethod=indent
" let g:vim_markdown_folding_disabled = 1


" START CONFIG FOR SEARCH
set hlsearch
set incsearch
set ignorecase smartcase
" END CONFIG FOR SEARCH


" START CONFIG FOR VIM THEME
set number              " display line number
set cursorline          " highlight current line
set colorcolumn=80      " highlight 80 column

" config for encoding
set encoding=utf8
set termencoding=utf8

" config for bottom status column
set ruler               " display status
set showmode            " display mode prompt
set laststatus=2

" config for colors
set t_Co=256
hi PmenuSel ctermbg=red ctermfg=white
hi Pmenu ctermbg=black ctermfg=white
hi Folded ctermfg=241 ctermbg=NONE
hi Search ctermfg=0
hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

" config for solarized
syntax on
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
" END CONFIG FOR VIM THEME


" START CONFIG FOR QUICK-KEY
nmap  gT          " CRTL-H switch to left tab
imap  <ESC>gT
nmap  gt          " CRTL-L switch to right tab
imap  <ESC>gt
nnoremap <F5> :make clean;make<CR>
nnoremap <F10> :AS<CR><C-W>5+
nnoremap <F11> :AS<CR><C-W>5-
" END CONFIG FOR QUICK-KEY


" START CONFIG FOR INDENT GUIDES
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=grey
" END CONFIG FOR INDENT GUIDES


" START CONFIG FOR TAGLIST
let Tlist_Auto_Open=1
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
nnoremap <silent> <F3> :TlistToggle<CR>
" END CONFIG FOR TAGLIST


" START CONFIG FOR NERD TREE
let NERDTreeWinPos='left'
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F2> :NERDTreeToggle<CR>
" END CONFIG FOR NERD TREE

 
" START CONFIG FOR NERD COMMENTER
" let g:NERDSpaceDelims = 1			" Add spaces after comment delimiters by default
" let g:NERDCompactSexyComs = 1		" Use compact syntax for prettified multi-line comments
" let g:NERDDefaultAlign = 'left'	" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDAltDelims_java = 1		" Set a language to use its alternate delimiters by default
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }	" Add your own custom formats or override the defaults
" let g:NERDCommentEmptyLines = 1		" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDTrimTrailingWhitespace = 1	" Enable trimming of trailing whitespace when uncommenting
" END CONFIG FOR NERD COMMENTER

" START CONFIG FOR SYNTAX CHECKING
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': ['sh', 'xml'],
    \ 'passive_filetypes': ['java', 'go']  }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_javascript_checkers = ['eslint']
" END CONFIG FOR SYNTAX CHECKING


" START CONFIG FOR NEOCOMPLETE
if has('lua')
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " For conceal markers.
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif

    " Enable snipMate compatibility feature.
    " let g:neosnippet#enable_snipmate_compatibility = 1
    " Tell Neosnippet about the other snippets
    " let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
endif
" END CONFIG FOR NEOCOMPLETE


" START CONFIG FOR VIM-GO
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 0
let g:go_fmt_autosave = 1
let g:go_play_open_browser = 0
let g:go_bin_path = expand("~/.go")
let g:go_get_update = 1
let g:go_list_type = "quickfix"
" END CONFIG FOR VIM-GO
