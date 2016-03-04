"escape to shel land call pdflatex on current file
map <F5> <esc>:w<CR>:!pdflatex %<CR>
imap <F5> <esc>:w<CR>:!pdflatex %<CR>

" shortcuts for hse prs environments
nmap <F3> i\begin{hse}<CR>\end{hse}<CR><esc>
imap <F3> \begin{hse}<CR>\end{hse}<CR>
nmap <F4> i\begin{prs}<CR>\end{prs}<CR><esc>
imap <F4> \begin{prs}<CR>\end{prs}<CR>
