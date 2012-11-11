set nocompatible               " be iMproved
filetype off                   " required!

colorscheme Tomorrow-Night
set clipboard=unnamed

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" Bundles
Bundle 'AutoClose'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-repeat'
Bundle 'leshill/vim-json'
Bundle 'bbommarito/vim-slim'
Bundle 'pangloss/vim-javascript'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-easymotion'

" brew install ctags in order to use tagbar
if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif

set background=dark
filetype plugin indent on     " required!
syntax on
set mouse=a
scriptencoding utf-8
set history=1000
set hidden

set tabpagemax=10               " only show 10 tabs
set showmode                    " display the current mode

autocmd BufNewFile,BufRead *.scss set filetype=css
autocmd BufNewFile,BufRead *.sass set filetype=css
" Save file after FocusLost
autocmd BufLeave,FocusLost * silent! wall
" Remove trailing whitespaces and ^M chars
autocmd FileType * autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

if has('cmdline_info')
  set ruler                   " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd                 " show partial commands in status line and
  " selected characters/lines in visual mode
endif

if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start  " backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " show matching brackets/parenthesis
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set foldenable                  " auto fold code
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

set nowrap                      " wrap long lines
set autoindent                  " indent at the same level of the previous line
set shiftwidth=2                " use indents of 2 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=2                   " an indentation every four columns
set softtabstop=2               " let backspace delete indent
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

let mapleader = ','
nnoremap j gj
nnoremap k gk
inoremap jj <Esc>
map [<Space> O<Esc>
map ]<Space> o<Esc>

vnoremap < <gv
vnoremap > >gv

" Ctags
set tags=./tags;/,~/.vimtags
" Generate ctags when the file is saved
autocmd BufLeave,FocusLost * silent! !ctags -R &

" NerdTree
map \ :NERDTreeToggle<CR>:NERDTreeMirror<CR>

let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" NerdCommenter
map <leader>/  <plug>NERDCommenterInvert

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>

" ctrlp
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<D-N>'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$' }

if has('gui_running')
  set guioptions-=T           " remove the toolbar
  set guioptions-=e           " standard tabs
  set lines=40                " 40 lines of text instead of 24,
  if has("gui_gtk2")
    set guifont=Menlo\ Regular\ 14,Consolas\ Regular\ 16,Courier\ New\ Regular\ 12,Andale\ Mono\ Regular\ 16
  else
    set guifont=Menlo\ Regular:h14,Consolas\ Regular:h16,Courier\ New\ Regular:h12,Andale\ Mono\ Regular:h16
  endif
else
  if &term == 'xterm' || &term == 'screen'
    set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
  endif
endif
