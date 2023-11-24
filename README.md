# vim_setting
1. install neovim ```brew install neovim```
2. install node ```brew install nodejs```
3. install yarn ```brew install yarn``` ( for markdown-preview plugin)
4. create directory ```mkdir -p ~/.config/nvim```
5. link config files 
```
    ln -s {local_absolute_path_for_the_root_of_this_package}/.vimrc ~/.config/nvim/init.vim
```
7. Check whether current python/python3 local path is current in the .vimrc file
6. add plug.vim to autoload folder
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
7. install plugins: start neovim, and execute ```:PlugInstall``` to install all the plugins in the config file
8. if cannot find syntac.vim, you need to execute the following command to link it:
    ln -s {local_path_for_the_vim_share_folder}/vim /usr/local/share/vim
9. install coc plugins:
```
:CocInstall coc-styled-components
:CocInstall coc-eslint
```
