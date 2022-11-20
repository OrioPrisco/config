"http://chrismarksus.github.io/2014/09/23/saving-your-vim-tab-splits.html
"mostly generated with mksession, appropriate commands were cherry picked
"and altered
set window=51
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
wincmd t
exe 'vert 1resize ' . (&columns - 171)
exe '2resize ' . ((&lines * 38 + 26) / 52)
exe 'vert 2resize ' . 84
exe '3resize ' . ((&lines * 38 + 26) / 52)
exe 'vert 3resize ' . 84
exe '4resize ' . ((&lines * 11 + 26) / 52)
exe 'vert 4resize ' . 171
terminal ++curwin ++cols=38 ++rows=50
wincmd l
wincmd j
terminal ++curwin ++cols=171 ++rows=11
