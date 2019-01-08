# Dot Vim

## get

```bash
git clone --recursive https://github.com/hfm/.vim.git $HOME/.vim
```

## vim-7.4

```bash
mkdir -p ~/usr/local/{bin,src}
cd ~/usr/local/src
curl -L -O ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar xvf vim-7.4.tar.bz2
cd vim74
./configure --prefix=~/usr/local/vim74
make && make install
ln -sf ~/usr/local/vim74/bin/vim ~/usr/local/bin/vim
```
