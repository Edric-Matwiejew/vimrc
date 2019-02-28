""""""""""""""""""""""""""""
"       Ed's .vimrc         "
" """""""""""""""""""""""""""

""" VIM BACKGROUND BEHAVIOUR """

filetype plugin on						" check file type on opening file, allows for filetype specific actions
set spellfile=~/en.utf-8.add	" set location of custom spellings dictionary.

" If plugin manager vim-plug is not installed, download and install it.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" INSTALLED PLUGINS. """
call plug#begin('~/.vim/plugged')

    Plug 'lervag/vimtex'        " editing of latex documents with a live preview
    Plug 'Yggdroot/indentLine'  " indentation markings
	Plug 'crusoexia/vim-monokai'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'jreybert/vimagit'
	Plug 'itchyny/lightline.vim'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'sickill/vim-pasta' "create + paste lines with correct indentation.
	"Plug 'vim-syntastic/syntastic' "syntax checking in vim, need to configure
	Plug 'ervandew/supertab' "context-aware auto-completion mapped to tab, working in insert mode
	Plug 'ctrlpvim/ctrlp.vim' "fuzzy file search

call plug#end()

""" VIM UI """
colorscheme monokai             " colourscheme
set t_Co=256					" needed for monokai styke colourschemes
let g:monokai_term_italic = 1	" enable italics with monokai in gui
let g:monokai_gui_italic = 1	" enable italics with monokai in gui
set number                      " show line numbers
set linebreak					" wrap with whole words
autocmd FileType fortran set colorcolumn=133             " place right hand ruler at the 133rd column
syntax enable                   " enable syntax highlighting
set showcmd                     " show command in bottom bar
set wildmenu                    " visual autocomplete for command menu
set showmatch                   " highlight matching parenthesis
autocmd FileType fortran set wrap!                       " turn off word-wrap
set number relativenumber		" actual number for active line, other numbers relative to that line

""" LIGHTLINE STATUSBAR """
set laststatus=2
set noshowmode

""" SPACES TABS AND INDENTATION """
set tabstop=4							" the width of a TAB is set to 4
set shiftwidth=4						" indents have a width of 4
set softtabstop=4						" number of columns for a TAB
autocmd FileType fortran set expandtab    " expand tabs to spaces if working in fortran
"set autoindent							" copies indentation from previous line
set smartindent							" adds indentation in some(?) cases

""" VIM FILE EXPLORER """
let g:netrw_browse_split = 4    " open files from filer explorer in active window
let g:netrw_winsize = 25        " explorer takes up 25 % of the displat
let g:netrw_liststyle = 3       " defualt view type is tree list view
let g:netrw_banner = 0          " hide directory banner

"" FOLDING ""
set foldenable          " enable folding
set foldlevelstart=0    " close most folds by default
set foldmethod=indent   " fold based on indent

""" VIMTEX SETTINGS """
let g:vimtex_view_general_viewer = 'zathura'	" setting the .pdf previewer.
let g:tex_conceal = ""							" display all typed code in full.

""" GLOBAL CUSTOM KEY MAPPINGS """
map <leader>o :setlocal spell! spelllang=en_au<CR>
" press <Space><Space> to move to + delete next <++>
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
" toggle mouse support on off
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc
" call mouse toggle function
map <leader>m :call ToggleMouse()<CR>
"" FORTRAN CUSTOM KEY MAPPINGS """
autocmd FileType fortran inoremap ;d do<Space><--><ESC>_oenddo<Esc>/<--><Enter>"_c4l
autocmd FileType fortran inoremap ;i if<Space>(<-->)<Space>then<Esc>_oendif<Esc>/<--><Enter>"_c4l

"" LATEX CUSTOM KEY MAPPINGS ""
" create equation environment
autocmd FileType tex inoremap ;e \begin{equation}<Return>\label{<-->}<Return><++><Return>\end{equation}<++><Esc>/<--><Enter>"_c4l
" math typsetting
autocmd FileType tex inoremap ;m \mathcal{<-->}<++><Esc>/<--><Enter>"_c4l
autocmd FileType tex inoremap ;h \hat{<-->}<++><Esc>/<--><Enter>"_c4l
autocmd FileType tex inoremap ;b \mathbf{<-->}<++><Esc>/<--><Enter>"_c4l
autocmd FileType tex inoremap ;v \vec{<-->}<++><Esc>/<--><Enter>"_c4l
autocmd FileType tex inoremap ;tl \tilde{<-->}<++><Esc>/<--><Enter>"_c4l
autocmd FileType tex inoremap ;. \ket{<-->}<++><Esc>/<--><Enter>"_c4l
autocmd FileType tex inoremap ;, \bra{<-->}<++><Esc>/<--><Enter>"_c4l
autocmd FileType tex inoremap ;t \textrm{<-->}<++><Esc>/<--><Enter>"_c4l
" create numbered and labelled equation

""" Map arrow keys to no operation
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""" Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_fortran_compiler = 'ifort' does not appeaer to function
