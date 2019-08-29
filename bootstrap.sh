# vim
mkdir -p "~/.vim/colors"
ln -s "$(pwd)/vim/monochrome.vim" ~/.vim/colors/monochrome.vim
ln -s "$(pwd)/vim/vimrc" ~/.vimrc
# macos
bash macos/set-defaults.sh
# bash
ln -s "$(pwd)/bash/bash_profile" ~/.bash_profile_prompt
echo "source ~/.bash_profile_prompt" >> ~/.bash_profile
