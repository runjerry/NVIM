# nvim
My personal neovim configurations. Install dependencies:

1. Install the latest neovim version

2. Git clone this repo
$ cd ~/.config
$ git clone git@github.com:runjerry/nvim.git

3. Install Nodejs (for coc),
recommended way: install with nvm (node version manager)

   - update package repository
   $ sudo apt update
   
   - download dependencies 
   $ sudo apt install build-essential checkinstall libssl-dev
   
   - install nvm
   $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.1/install.sh | bash
   
   - close and reopen terminal
   
   - verify nvm version and check versions
   $ nvm --version
   $ nvm ls  (check which version running on the system)
   $ nvm ls-remote  (check newly available releases)
   
   - install node using nvm
   $ nvm install [version.number]
   
   - choose which node version to use
   $ nvm use [version.number]

4. Install ripgrep and bat (for fzf)
   - install Rust
   $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   
   - build ripgrep following 
   https://github.com/BurntSushi/ripgrep#installation
   
   - install bat (for fzf layout colorscheme)
   $ cargo install bat
   
   - set BAT_THEME env variable in .zshrc/.bashrc
   export BAT_THEME="zenburn"
