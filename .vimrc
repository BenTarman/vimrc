set nocompatible              " required
filetype off                  " required
set encoding=utf8
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"GENERIC FOR ALL LANGUAGES
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Bundle 'Valloric/YouCompleteMe'


"auto complete plugins
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'

"utility
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'


" Commenting and uncommenting stuff
Plugin 'tomtom/tcomment_vim'

" Every one should have a pair (Autogenerate pairs for "{[( )
Plugin 'jiangmiao/auto-pairs'

"gruvbox color scheme
Plugin 'morhetz/gruvbox'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'

"status bar
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'SirVer/ultisnips'


Plugin 'tmhedberg/SimpylFold'


"PYTHON PLUGINS
Plugin 'vim-scripts/indentpython.vim'


"RUBY PLUGINS
Plugin 'tpope/vim-rails' "rails stuff :S
Plugin 'ecomba/vim-ruby-refactoring' "refactoring tools
Plugin 'vim-ruby/vim-ruby' "syntax higlighting for ruby

"HASKELL PLUGINS
Plugin 'dag/vim2hs' "light-weight syntax checking
"Plugin 'raichoo/haskell-vim'
Plugin 'Shougo/vimproc.vim'
call vundle#end()            " required

filetype plugin indent on    " required
syntax on
syntax enable


" Show trailing whitespace and spaces before a tab:

" Remove highlights with leader + enter (leader is \ key)
nmap <Leader><CR> :nohlsearch<cr>

set background=dark
"add color scheme
"colorscheme gruvbox

set splitbelow
set splitright



"cntrl j moves below, k above, l right, h left
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set nu

"support utf8
set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"map jk to escape key
ino jk <esc>
cno jk <c-c>

ino kj <esc>
cno kj <c-c>
vno v <esc>

"toggle NERDTREE stuff
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TlistToggle<CR>

"helps copy/paste better
set clipboard=unnamed


" Track the engine.
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

"Enable folding
 set foldmethod=indent
 set foldlevel=99

"enable folding with the spacebar
nnoremap <space> za

"force myself to not use arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


"override default <tab> from snipMate (<tab> is for ycm)
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup



" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif



:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/ 

"PYTHON SETTINGS
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ let python_higlight_all=1 |
    \ :highlight ExtraWhitespace ctermbg=blue guibg=blue|

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |


"RUBY SETTINGS
au BufNewFile,BufRead *.rb
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"HASKELL SETTINGS
au BufNewFile,Bufread *.hs
	\ set nocompatible |
 	\ set number |
	\ set nowrap |
	\ set showmode |
	\ set tw=80 |
	\ set smartcase | 
	\ set smarttab |
	\ set smartindent |
	\ set autoindent |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab |
	\ set incsearch |
	\ set history=1000 |
	\ set clipboard=unnamedplus,autoselect |
	\ set completeopt=menuone,menu,longest |
	\ set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox |
	\ set wildmode=longest,list,full |
	\ set wildmenu |
	\ set t_Co=256 |

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>



map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
