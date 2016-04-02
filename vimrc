set	ls=2 " Show a status line even when only one window is shown
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

"setting up solarized colorscheme
" set t_Co=256 "enable 256-color mode
let g:solarized_termcolors=256
set background=dark
" colorscheme solarized

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
nmap <C-l> :tabn<CR>    " Switch to the next tab
nmap <C-h> :tabp<CR>    " Switch to the previous tab
nmap <C-n> :tabnew<CR>  " Open a new tab
nmap <C-x> :tabclose<CR>" Close current tab
nmap <silent> <A-PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>h " Move current tab to the left (h suffix to keep cursor in the place)
nmap <silent> <A-PageDown> :execute 'silent! tabmove ' . tabpagenr()<CR>hhhh " Move current tab to the right (hhhh suffix to keep cursor in place)

"redraw screen
nmap <C-j> :redraw!<CR> " Redraw the screen

"highlight before searching
nmap * *N
nmap # #N

"fold options
set foldmethod=indent " auto fold based on indent level
set nofoldenable
"au BufWinLeave *.* mkview " autocommand on closing a file to store the folds 
"au BufWinEnter *.* silent loadview " autocommand on opening a file to file's latest fold configuration

"enable mouse in all modes
set mouse=a

"pathogen for easy installation of plugins
execute pathogen#infect()

"syntastic options
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
    "note blank space or comma at end of lines
let g:syntastic_python_pylint_args="--max-line-length=130 
                                   \--max-args=10 "
command Scheck SyntasticCheck

au BufRead,BufNewFile *.hac set filetype=hackt
au BufRead,BufNewFile *.actmx set filetype=hackt
au BufRead,BufNewFile *.act set filetype=hackt
au! Syntax hackt source ~/.vim/syntax/hackt.vim
