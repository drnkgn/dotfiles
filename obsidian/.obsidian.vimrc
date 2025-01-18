" Split
exmap splitVertical obcommand workspace:split-vertical
nnoremap <C-w>v :splitVertical<Cr>

exmap splitHorizontal obcommand workspace:split-horizontal
nnoremap <C-w>s :splitHorizontal<Cr>

" Focus on splits
exmap ftop obcommand editor:focus-top
nmap <C-w>k :ftop

exmap fbottom obcommand editor:focus-bottom
nmap <C-w>j :fbottom

exmap fleft obcommand editor:focus-left
nmap <C-w>h :fleft

exmap fright obcommand editor:focus-right
nmap <C-w>l :fright

" Close pane
exmap q obcommand workspace:close
