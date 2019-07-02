# vim_setting
1. Set up configs:
    ln -s {local_path_for_the_files} ~/.vim
    ln -s {local_path_for_the_files}.vimrc ~/.vimrc

2. pull submodules
    git submodules update

3. install ctags
    Debian: sudo apt-get install exuberant-ctags
    Red Hat: sudo yum install ctags

4. if cannot find syntac.vim, you need to execute the following command to link it:
    ln -s {local_path_for_the_vim_share_folder}/vim /usr/local/share/vim
    
