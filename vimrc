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
syntax enable "enable syntax highlighting

"setting up solarized colorscheme
set t_Co=256 "enable 256-color mode
let g:solarized_termcolors=256
set background=light
colorscheme solarized

"define a command to clear search buffer
command C let @/=""
"make W also save just like w
command W w

"tab navigation"
nmap <C-l> :tabn<CR>    " Switch to the next tab
nmap <C-h> :tabp<CR>    " Switch to the previous tab
nmap <C-n> :tabnew<CR>  " Open a new tab
nmap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR> " Move current tab to the left
nmap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>    " Move current tab to the right
