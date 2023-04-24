# **NVIM Configuration**

## **Install Packer.nvim**
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 

## **Install ripgrep**
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt install ripgrep


## **Install Node Version Manager (nvm)**
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh
### check available versions of Nodes
nvm ls-remote
### install one from the list
nvm install vxx.xx.x


## **Install npm**
### if encountered error: 
npm : Depends: node-gyp (>= 0.10.9) but it is not going to be installed
### install first: 
sudo apt-get install nodejs-dev node-gyp libssl1.0-dev
### then
sudo apt install npm


## **Install fd**
npm install -g fd-find


## **git clone to ~/.config/nvim, and remove the following**
rm ~/.config/nvim/plugin/packer_compiled.lua


## **For Mason, need change writing permission for the following**
sudo mkdir /usr/share/nvim/lsp
sudo chmod -R o+w /usr/share/nvim/lsp


## **First time open nvim**
:TSupdate
:PackerSync
:Mason
