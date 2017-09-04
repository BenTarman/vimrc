set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Bundle 'Valloric/YouCompleteMe'

Plugin 'scrooloose/syntastic'

Plugin 'nvie/vim-flake8'


"gruvbox color scheme
Plugin 'morhetz/gruvbox'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'


Plugin 'tpope/vim-fugitive'

"status bar
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'tmhedberg/SimpylFold'


Plugin 'vim-scripts/indentpython.vim'

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required


set background=dark
"add color scheme
colorscheme gruvbox

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
inoremap jk <esc>
inoremap kj <esc>

"toggle NERDTREE stuff
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TlistToggle<CR>

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


 "pep8 standards
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent




let python_higlight_all=1
