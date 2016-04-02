"escape to shel land call pdflatex on current file
map <F5> <esc>:w<CR>:!pdflatex %<CR>
imap <F5> <esc>:w<CR>:!pdflatex %<CR>

" shortcuts for hse prs environments
nmap <F3> o\begin{hse}<CR>\end{hse}<esc>ko
imap <F3> \begin{hse}<CR>\end{hse}<esc>ko
nmap <F4> o\begin{prs2}<CR>\end{prs2}<esc>ko
imap <F4> \begin{prs2}<CR>\end{prs2}<esc>ko
