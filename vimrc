set laststatus=1 " Show a status line even when only one window is shown
set showcmd " Show command completion as typing command
set incsearch " Highlight as searched phrase is entered
set hlsearch " Highlight searched phrases
set ruler " Always show info along bottom
set title " Always show title of file along bottom
set number " Show line numbers 
set tabstop=4 " Number of columns in a tab
set shiftwidth=4  " Number of columns with << and >> and auto C-style indentation
set softtabstop=4 " Number of columns the Tab inserts in insert mode
set expandtab " Expand tabs into spaces
set autoindent " Use previous line's indentation on next line
set smartindent " does the right thing (mostly) in programs. turn off if annoying
set tags=tags;~ " Look for tags recursively until home directory is reached
set colorcolumn=80 "highlight column 80
syntax enable "enable syntax highlighting
filetype plugin on "enable filetype specific settings

"move up and down within a wrapped line
nnoremap k gk
nnoremap j gj

"command to clear search buffer
command C let @/=""

"commands to handle common typing errors
"make W also save just like w
command W w
"make Q behave like q
command Q q
"make E behave like e
command -nargs=? -complete=file E edit <args>

"tab navigation"
nmap <C-w><C-l> :tabn<CR>     " Switch to the next tab
nmap <C-w><C-h> :tabp<CR>     " Switch to the previous tab
nmap <C-w><C-n> :tabnew<CR>   " Open a new tab
nmap <C-w><C-x> :tabclose<CR> " Close current tab
nmap <C-w><C-q> :-tabmove<CR> " Move current tab to the left
nmap <C-w><C-w> :+tabmove<CR> " Move current tab to the right

"highlight before searching
nmap * *N
nmap # #N

"fold options
set foldmethod=indent " auto fold based on indent level
set nofoldenable

"enable mouse
set mouse=r

" ####### act syntax highlighting ############################################
au BufRead,BufNewFile *.hac set filetype=hackt
au BufRead,BufNewFile *.actmx set filetype=hackt
au BufRead,BufNewFile *.act set filetype=hackt
au! Syntax hackt source ~/.vim/syntax/hackt.vim

" ####### vim-plug ###########################################################
" install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" plugin section
call plug#begin('~/.vim/plugged')
    Plug 'powerline/powerline', { 'rtp': 'powerline/bindings/vim' }
    Plug 'vim-syntastic/syntastic'
    Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" ####### syntastic ##########################################################
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
    "note blank space or comma at end of lines
let g:syntastic_python_pylint_args="--max-line-length=130 
                                   \--max-args=10 "
command Scheck SyntasticCheck
