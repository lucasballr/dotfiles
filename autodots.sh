#! /bin/sh

# Attempt to install fish package using different package managers
install_pac() {
    pac=$1
    fail="Failed to install $pac"
    if command -v "$pac" >/dev/null 2>&1; then
	return
    fi
    if command -v apt-get &> /dev/null; then
      sudo apt-get install -y $pac || echo $fail
    elif command -v yum &> /dev/null; then
      sudo yum install -y $pac || echo $fail
    elif command -v pacman &> /dev/null; then
      sudo pacman -S --noconfirm $pac || echo $fail
    elif command -v brew &> /dev/null; then
      brew install $pac || echo $fail
    elif command -v dnf &> /dev/null; then
      sudo dnf install -y $pac || echo $fail
    else
      echo "Package manager not found. Please install $pac manually."
    fi
}

install_dots() {
    echo "Importing Dots"
    if [ -d "$HOME/.dots" ]; then 
	cd $HOME/.dots && git pull
    else
	git clone https://github.com/lucasballr/dotfiles.git $HOME/.dots
    fi

    cp -a "$HOME/.dots/u_dots/." "$HOME/.config"
}

install_pac "fish"
if command -v apt-get &> /dev/null; then
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt update
elif command -v dnf &> /dev/null; then
    sudo dnf install fd-find
fi

install_pac "neovim"
install_pac "git"
install_pac "curl"
install_pac "fzf"
install_pac "exa"
install_pac "cmake"
install_pac "zoxide"

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

if ! command -v starship >/dev/null 2>&1; then
		curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

install_dots

if ! command -v cargo >/dev/null 2>&1; then
		curl https://sh.rustup.rs -sSf | sh -s -- -y
fi
if [ ! $SHELL = $(which fish) ]; then 
		chsh -s $(which fish)
fi

