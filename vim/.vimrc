" ----------------------- basic
set nocompatible    " no  compatibility for vi
filetype off        " for vundle
set ci			    " auto indentation
set bs=2		    " insert mode backspace delete
set showmatch		" code match
set laststatus=2	" always show status bar
set number		    " show line number
set autoread		" auto load if changed out of vim
set t_Co=256        " explicitly tell Vim that the terminal supports 256 colors
set hls			    " highlight the pattern

" ----------------------- 80 column rule
set colorcolumn=80  " highlight the 80 column
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ------------- remap
imap fg <Esc>
let mapleader = ','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>i
nmap lh 0
nmap le $
set pastetoggle=<F9>

" ------------- cursor
set gcr=a:block-blinkon0    " cursor no blinki
set cursorline		        " underline of cursor's line

" ------------- encoding
set encoding=utf-8
set fileencodings=utf-8

" ------------- convert tab to space
set tabstop=4 
set shiftwidth=4 
set expandtab

" ------------- syntax
syntax on
colorscheme desert
set background=light

" ------------- fold
set foldmethod=manual

" ------------- searching
set ignorecase  " ignore letter's capital and lower case in searching
nnoremap <CR> :nohlsearch<CR><CR> 
highlight Search cterm=bold ctermbg=white ctermfg=black

" ------------- file indent
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ai
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sw=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ts=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sts=4
autocmd FileType javascript,html,css,xml,vue set ai
autocmd FileType javascript,html,css,xml,vue set sw=4
autocmd FileType javascript,html,css,xml,vue set ts=4
autocmd FileType javascript,html,css,xml,vue set sts=4

" ------------- vue to html
autocmd BufNewFile,BufRead *.vue set filetype=html

" ------------- file
set confirm 
set nobackup " no .tmp
set noswapfile "no .swp

" ----------------------- load plugins start
call plug#begin('~/.vim/plugged')

" ------------- plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'Yggdroot/indentLine'
Plug 'fholgado/minibufexpl.vim'
Plug 'mattn/emmet-vim'
Plug 'ternjs/tern_for_vim'
Plug 'othree/vim-autocomplpop'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'editorconfig/editorconfig-vim'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'L9'
" ------------- load plugins end 
call plug#end()

" ----------------------- filetype
filetype plugin indent on

" ----------------------- nerdtree
let NERDTreeWinPos='right'
nnoremap <F4> :NERDTreeToggle<CR>

" ----------------------- airline
let g:airline_powerline_fonts = 1

" ----------------------- omnicomplete
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" ----------------------- supertab
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" ----------------------- indentline
let g:indentLine_enabled = 1
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239

" ----------------------- minibufexpl
map <Leader>m :MBEbn<cr>
map <Leader>n :MBEbp<cr>

" ----------------------- emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" ----------------------- ack
:map <F2> :Ack -i
let g:ackprg = 'ag --nogroup --nocolor --column'

" ----------------------- ultisnips
let g:UltiSnipsExpandTrigger = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]

" ----------------------- js-beautify
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" ----------------------- vim css3 syntax
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END
