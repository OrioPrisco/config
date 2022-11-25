"https://superuser.com/questions/93492/how-to-add-a-command-in-vim-editor
"hand written, much shorter
command Layout1 exe 'vert term' | wincmd l | exe 'bel term' | wincmd k | vert resize 172 | vsplit | exe '4resize ' . ((&lines * 11 + 26) / 52)

