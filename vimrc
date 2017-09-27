set laststatus=1 " Show a status line even when only one window is shown
set showcmd " Show command completion as typing command
set incsearch " Highlight as searched phrase is entered
set hlsearch " Highlight searched phrases
set ruler " Always show info along bottom
set title " Always show title of file along bottom
set number " Show line numbers
set relativenumber " Show relative line numbers
set tabstop=4 " Number of columns in a tab. See F2 command below for toggle
set shiftwidth=4  " Number of columns with << and >> and auto C-style indentation
set softtabstop=4 " Number of columns the Tab inserts in insert mode
set expandtab " Expand tabs into spaces
" set autoindent " Use previous line's indentation on next line
set smartindent " does the right thing (mostly) in programs. turn off if annoying
set tags=tags;~ " Look for tags recursively until home directory is reached
set colorcolumn=100 "highlight column 100 by default, see F4 command below for toggle
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
nmap * *Nzz
nmap # #Nzz

"fold options
set foldmethod=indent " auto fold based on indent level
set nofoldenable

"enable mouse
set mouse=r

" ####### Function F key mappings ############################################
" F2 to toggle between 2 and 4 space indents
function Toggle_indent() abort
    if &l:tabstop == 4
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
    else
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
    endif
endfunction
nnoremap <silent> <F2> :call Toggle_indent() <CR>
" F3 to toggle paste mode (turns off autoindent)
set pastetoggle=<F3>
" F4 to toggle color column
function Toggle_colorcolumn(cc) abort
    if &l:colorcolumn == a:cc
        execute "set colorcolumn="
    else
        execute "set colorcolumn=".a:cc
    endif
endfunction
nnoremap <silent> <F4> :call Toggle_colorcolumn(100) <CR>
" F5 to remove unwanted whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" F8 to open directory of current file
nnoremap <silent> <F8> :e %:h <CR>

" ####### cscope #############################################################
if has("cscope")
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    function Cscope_find_definition(querytype, name, splittype) abort
        if a:splittype == "vertical"
            execute "vert scs find" a:querytype a:name
        elseif a:splittype == "none"
            execute "cs find" a:querytype a:name
        elseif a:splittype == "horizontal"
            execute "scs find" a:querytype a:name
        endif
        " if cursor is not on a:name, look for it
        " some cscope commands only go to the start of the line containing a:name
        " instead of going to a:name itself
        if expand("<cword>") !=# a:name
            call search(a:name)
        endif
        normal! zz
    endfunction

    map f<C-]> :call Cscope_find_definition("g", expand("<cword>"), "vertical")<CR>
    map f<C-[> :call Cscope_find_definition("c", expand("<cword>"), "vertical")<CR>
    map f<C-\> :call Cscope_find_definition("s", expand("<cword>"), "vertical")<CR>

    map ff<C-]> :call Cscope_find_definition("g", expand("<cword>"), "none")<CR>
    map ff<C-[> :call Cscope_find_definition("c", expand("<cword>"), "none")<CR>
    map ff<C-\> :call Cscope_find_definition("s", expand("<cword>"), "none")<CR>

    map fff<C-]> :call Cscope_find_definition("g", expand("<cword>"), "horizontal")<CR>
    map fff<C-[> :call Cscope_find_definition("c", expand("<cword>"), "horizontal")<CR>
    map fff<C-\> :call Cscope_find_definition("s", expand("<cword>"), "horizontal")<CR>
endif

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
    if has("python") || has("python3")
        Plug 'powerline/powerline', { 'rtp': 'powerline/bindings/vim' }
    endif
    Plug 'vim-syntastic/syntastic'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'airblade/vim-gitgutter'
    Plug 'jeetsukumaran/vim-buffergator'
call plug#end()

" ####### syntastic ##########################################################
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
    "note blank space or comma at end of lines
let g:syntastic_python_pylint_args="--max-line-length=130
                                   \--max-args=10 "
command Scheck SyntasticCheck

" ####### vim-gitgutter ######################################################
set updatetime=250
" ]c jump to next hunk
" [c jump to previous hunk
" <Leader>hs hunk stage
" <Leader>hu hunk unstage

" ####### vim-buffergator ####################################################
" <leader>b to list buffers
" in buffer listing:
"   <C-v> to open in vertical split
"   <C-s> to open in horizontal split
"   <C-t> to open in new tab
