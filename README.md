# vimsetup
My Persoal Vim setup & notes

# Philosophies
- Never :q quite. Use buffers
- Tabs are just workspaces. Don't think of them as files

# Notes:
- nnoremap means normal mode non-recursive map
- nmap is normal mode map recursively
- The default `<leader>` key is a backslash `\`
- ftplugin = filetype plugins

# perl language server (used by coc-perl)
cpan Perl::LanguageServer

# Cheat Sheet
- :OpenSession <name> :SaveSession <name>  - open and close sessions 
- <leader>[1-9]  - remapped tab navigation
- gt/gT switch tabs
- :bd <num>  delete buffer #num (doesn't actually delete a file. just removes buffer)
- :vs or :sp  (vertical or horizontal split)
- <C+w>n - split horizontal and create new buffer
- :args /<path>/**/*.svelte   loads all .svelte files in path into buffers
- :b <partial_string>  will open a buffer where filename partially matches
- :ls lists all buffers
- gd - go to definition of variable or function
- \f - go to nerd tree  s - open file in split mode
- <ctrl+w>o - maximize/minimize windows (uses funcs from autoload/win.vim)
- K - get documentation about a function/symbol (coc function)
- \l - toggle gutter line numbers (uses funcs from autoload/win/vim)
- \g - show diagnostics pane (sames as :CocDiagnostics)
- q<letter> start record.  q again. stop.  @<letter> replay recording
- .  - redo last motion
- :terminal <C+\><C+n>  - enter terminal normal mode.  i or a to go back to job mode
- :mksession! ~/.vim/dev.vim  - creates session to restore
- :wviminfo! ~/.vim/dev.viminfo - create vim info (its differen than session.)
- :source dev.vim  or vim -S dev.vim to load session
- :rviminfo! ~/.vim/dev.viminfo - loads the viminfo

# install Plug (my preferred plugin tool.  they all seem good though)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# TO install or update plugins
# run :PlugInstall or :PlugUpdate to install/update plugins periodically
# run :CocUpdate


# setup vim wiki
mkdir ~/.vimwiki
ln -s .vimwiki ~/git/vimsetup/vimwiki

# install airblade

mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
vim -u NONE -c "helptags vim-gitgutter/doc" -c q

## LINUX INSTALLATION NOTES
yum install -y ctags git tcl-devel  ruby ruby-devel  lua lua-devel  luajit luajit-devel  python python-devel  perl perl-devel  perl-ExtUtils-ParseXS  perl-ExtUtils-XSpp  perl-ExtUtils-CBuilder  perl-ExtUtils-Embed
# linux setup python3 (some plugins need it)
yum install -y zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel
yum install -y python python-devel python36u python36u-devel
yum install -y tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder perl-ExtUtils-Embed cscope gtk3-devel libSM-devel libXt-devel libXpm-devel libappstream-glib libacl-devel gpm-devel
yum install -y ncurses-devel




make && sudo make install

hash -r
curl https://pyenv.run | bash
add to .bashrc
```bash
export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```
```bash
pyenv install 3.9.2
pyenv global 3.9.2
```

```bash
scl enable devtoolset-8 bash
cd
git clone https://github.com/vim/vim.git
cd vim

./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --with-tlib=ncurses \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-terminal \
    --enable-cscope \
    --prefix=/opt/vim \
    --with-python3-command=python3
make install
```

copy various vim dirs and autoload dirs
```
cp -r UltiSnips ~/.vim/
cp coc-settings.json ~/.vim/
cp autoload/* ~/.vim/autoload/
```

# install fonts and fzf
#linux
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
yum install -y the_silver_searcher bat ripgrep
# note bat and ripgrep may not be found
yum install -y clang-tools

#mac
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
brew install the_silver_searcher bat ripgrep
brew install llvm


# setup LSP servers for syntax highlighting
npm i -g svelte-language-server eslint prettier prettier-plugin-svelte vim-language-server
# setup COC plugins

cpanm Perl::LanguageServer

" Install new CoC modules by updating the array 
```viml
let g:coc_global_extensions = [
      \ 'coc-tsserver', 
      \ 'coc-html', 
      \ 'coc-css', 
      \ 'coc-svelte', 
      \ 'coc-eslint', 
      \ 'coc-json', 
      \ 'coc-git',
      \ 'coc-prettier',
      \ 'coc-swagger',
      \ 'coc-clangd',
      \ 'coc-python',
      \ 'coc-snippets',
      \ 'coc-vimlsp',
      \ 'coc-perl',
\ ]

```

This is for permissions
```viml
:CocCommand eslint.showOutputChannel
:CocCommand tsserver.showOutputChannel
```


# MAC env setup
brew install bash-completion

# setup symlinks to .vimrc and coc-settings.json
```
ln -s ~/git/vimsetup/.vimrc ~/.vimrc
ln -s ~/git/vimsetup/coc-settings.json ~/.vim/coc-settings.json
```
