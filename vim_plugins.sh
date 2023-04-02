mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
wget https://raw.githubusercontent.com/cassepipe/ale_norminette/main/norminette.vim -O ~/.vim/pack/git-plugins/start/ale/ale_linters/c/norminette.vim -nc
