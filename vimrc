set ls=2 " Show a status line even when only one window is shown
set showcmd " Show command completion as typing command
set incsearch " Highlight as searched phrase is entered
set hlsearch " Highlight searched phrases
set ruler " Always show info along bottom
set title " Always show title of file along bottom
set number " show line numbers 
set tabstop=4
syntax enable "enable syntax highlighting

"pathogen stuff, looks like this handles runtime path manipulation
"used when activating plugins
execute pathogen#infect()
filetype plugin indent on " filetype detecion[ON] plugin[ON] indent[ON]

"setting up solarized colorscheme
set t_Co=256 "enable 256-color mode
let g:solarized_termcolors=256
set background=light
colorscheme solarized
