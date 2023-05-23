mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
wget https://raw.githubusercontent.com/cassepipe/ale_norminette/main/norminette.vim -O ~/.vim/pack/git-plugins/start/ale/ale_linters/c/norminette.vim -nc

#wget https://raw.githubusercontent.com/octol/vim-cpp-enhanced-highlight/master/after/syntax/c.vim -O ~/.vim/after/syntax/c.vim -nc
wget https://raw.githubusercontent.com/octol/vim-cpp-enhanced-highlight/master/after/syntax/cpp.vim -O ~/.vim/after/syntax/cpp.vim -nc
