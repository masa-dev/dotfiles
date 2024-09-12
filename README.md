# dotfles

my dotfiles

## configure files
- neovim


### NeoVim

```bash
# GCC
sudo apt install gcc

# stylua
curl -LO https://github.com/JohnnyMorganz/StyLua/releases/download/v0.20.0/stylua-linux-x86_64.zip
unzip stylua-linux-x86_64.zip
sudo mv stylua /usr/local/bin/

### WSLのみ設定
curl -LO https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
unzip -j win32yank-x64.zip win32yank.exe
mkdir ~/bin
mv ./win32yank.exe ~/bin/
cd ~/bin
chmod +x win32yank.exe 

sudo apt install wl-clipboard -y
```

WSL2でwin32yankを入れた際には`.bashrc`に以下の内容を追加

```bash
export PATH=$HOME/bin:/usr/local/bin:$PATH
```
