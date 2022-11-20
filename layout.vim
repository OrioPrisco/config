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
exe 'vert 1resize ' . ((&columns * 38 + 105) / 211)
exe '2resize ' . ((&lines * 38 + 26) / 52)
exe 'vert 2resize ' . ((&columns * 86 + 105) / 211)
exe '3resize ' . ((&lines * 38 + 26) / 52)
exe 'vert 3resize ' . ((&columns * 85 + 105) / 211)
exe '4resize ' . ((&lines * 11 + 26) / 52)
exe 'vert 4resize ' . ((&columns * 172 + 105) / 211)
terminal ++curwin ++cols=38 ++rows=50
wincmd l
wincmd j
terminal ++curwin ++cols=172 ++rows=11 
