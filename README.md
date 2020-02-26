# vim_setting
1. install neovim ```brew install neovim```
2. install node ```brew install nodejs```
3. install dein for plugin manager:
```
    cd ~/Downloads/
    mkdir dein
    cd dein
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
```
4. create directory ```mkdir -p ~/.config/nvim```
5. link config files 
```
    ln -s {local_absolute_path_for_the_root_of_this_package}/.vimrc ~/.config/nvim/init.vim
```
6. install python3 for deoplete.nvim 
``
    brew install python3
    pip3 install pynvim
7. install plugins: start neovim, and execute ```":call dein#install()```" to install all the plugins in the config file
8. if cannot find syntac.vim, you need to execute the following command to link it:
    ln -s {local_path_for_the_vim_share_folder}/vim /usr/local/share/vim
    
## note
* if you want to remove certain plugin, update in .vimrc and run
```console
:call dein#recache_runtimepath()

```
