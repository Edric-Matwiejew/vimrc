"  ____  ____  _ ____      _  _  __  _  _  ____   ___
" (  __)(    \(// ___)    / )( \(  )( \/ )(  _ \ / __)
"  ) _)  ) D (  \___ \   _\ \/ / )( / \/ \ )   /( (__
" (____)(____/  (____/  (_)\__/ (__)\_)(_/(__\_) \___)
"
" This is my .vimrc, there are many like it, but this
" one is mine.

" VIM INITIALISATION

" check file type on opening file, allows for filetype specific actions
filetype plugin on
" set location of custom spellings dictionary.
set spellfile=~/en.utf-8.add
" directory of active window is set to the directory of the opened buffer
autocmd BufEnter * silent! lcd %:p:h

" If plugin manager vim-plug is not installed, download and install it.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" FUNCTIONS

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

" PLUGINS

call plug#begin('~/.vim/plugged')

	"Edit Latex documents with live preview.
  	Plug 'lervag/vimtex'
	"Indentation markings.
   	Plug 'Yggdroot/indentLine'
	"Snazzy colorscheme
	Plug 'crusoexia/vim-monokai'
	"i3-wm syntax highlighting
	Plug 'PotatoesMaster/i3-vim-syntax'
	"Lightline status bar.
	Plug 'itchyny/lightline.vim'
	"Function to delete trailing whitespace.
	Plug 'bronson/vim-trailing-whitespace'
	"List defined variables and functions.
	Plug 'https://github.com/majutsushi/tagbar'
	"Create and paste lines with context sensitive indentaion.
	Plug 'sickill/vim-pasta'
	"Fuzzy search
	Plug 'ctrlpvim/ctrlp.vim'
	" autocomplete quotes, brakets, braces
	Plug 'https://github.com/Raimondi/delimitMate'
	"auto complete?
	Plug 'https://github.com/ajh17/VimCompletesMe'
	"diff between sections of the same document
	Plug 'https://github.com/AndrewRadev/linediff.vim'

call plug#end()

" PLUGIN SETTINGS

" vimtex
let g:vimtex_view_general_viewer = 'zathura'	" setting the .pdf previewer.
let g:tex_conceal = ""							" display all typed code in full.

" lightline statusbar
set laststatus=2
set noshowmode

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_fortran_compiler='gfortran'
"let g:syntastic_fortran_remove_include_errors=1

" VIM SETTINGS

colorscheme monokai             " colourscheme
set t_Co=256					" needed for monokai styke colourschemes
let g:monokai_term_italic = 1	" enable italics with monokai in gui
let g:monokai_gui_italic = 1	" enable italics with monokai in gui
set number                      " show line numbers
set number relativenumber		" actual number for active line, other numbers relative to that line
set linebreak					" wrap with whole words
syntax enable                   " enable syntax highlighting
set showcmd                     " show command in bottom bar
set wildmenu                    " visual autocomplete for command menu
set splitbelow					" splits will open in a bottown window
set showmatch                   " highlight matching parenthesis

" Spaces, tabs and indentation
set tabstop=4					" the width of a TAB is set to 4
set shiftwidth=4				" indents have a width of 4
set softtabstop=4				" number of columns for a TAB
set smartindent					" context sensitive indentaion

" Vim file explorer
let g:netrw_browse_split = 4    " open files from filer explorer in active window
let g:netrw_winsize = 25        " explorer takes up 25 % of the displat
let g:netrw_liststyle = 3       " defualt view type is tree list view
let g:netrw_banner = 0          " hide directory banner

" folding behaviour
set foldenable          " enable folding
set foldlevelstart=99   " should start with all folds open
set foldmethod=indent   " fold based on syntax

" Vim terminal
set termsize=10x0

" CUSTOM KEY MAPPINGS

" Spellcheck on
map <leader>o :setlocal spell! spelllang=en_au<CR>

" open splitscreen terminal 
map <F9> <CR>:terminal<CR>


" call mouse toggle function
map <leader>m :call ToggleMouse()<CR>

" toggle taglist
nmap <F8> :TagbarToggle<CR>

" Map arrow keys to no operation!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" LANGUAGE SPECIFIC SETTINGS

"Fortran
autocmd FileType fortran set colorcolumn=80 " place right hand ruler at the 80th column
autocmd FileType fortran set wrap!          " turn off word-wrap
autocmd FileType fortran set expandtab		" expand tabs to spaces if working in fortran
