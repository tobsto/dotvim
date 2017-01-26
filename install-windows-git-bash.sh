git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Create symlinks:

ln -s ~/.vim/vimrc-windows-git-bash ~/.vimrc

# create temp dir
mkdir -p ~/.vim/tmp/undo
mkdir -p ~/.vim/tmp/swap
mkdir -p ~/.vim/tmp/backup

# Switch to the `~/.vim` directory, and fetch submodules:

cd ~/.vim
git submodule init
git submodule update
cd -

# Install Bundles
vim +BundleInstall +qall
