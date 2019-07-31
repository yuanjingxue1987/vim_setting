# vim_setting
1. install neovim ```brew install neovim```
2. install dein for plugin manager:
```
    cd ~/Downloads/
    mkdir dein
    cd dein
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
```
3. create directory ```mkdir -p ~/.config/nvim```
4. link config files 
```
    ln -s {local_absolute_path_for_the_root_of_this_package}/.vimrc ~/.config/nvim/init.vim
```
5. install python3 for deoplete.nvim 
```
    brew install python3
    pip3 install pynvim
```
6. install plugins: start neovim, and execute ```:PluginInstall``` to install all the plugins in the config file
7. if cannot find syntac.vim, you need to execute the following command to link it:
    ln -s {local_path_for_the_vim_share_folder}/vim /usr/local/share/vim
    

