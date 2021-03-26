# vimsetup
My Persoal Vim setup & notes

# Philosophies
- Never :q quite. Use buffers
- Tabs are just workspaces. Don't think of them as files

# Notes:
- nnoremap means normal mode non-recursive map
- nmap is normal mode map recursively
- The default `<leader>` key is a backslash `\`


# Cheat Sheet
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
- \n - toggle gutter line numbers (uses funcs from autoload/win/vim)
- \g - show diagnostics pane (sames as :CocDiagnostics)
- q<letter> start record.  q again. stop.  @<letter> replay recording
- .  - redo last motion
- :terminal <C+\><C+n>  - enter terminal normal mode.  i or a to go back to job mode

# install Plug (my preferred plugin tool.  they all seem good though)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# run :PlugInstall or :PlugUpdate to install/update plugins periodically

# install airblade

mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
vim -u NONE -c "helptags vim-gitgutter/doc" -c q

## LINUX INSTALLATION NOTES
yum install -y ctags git tcl-devel  ruby ruby-devel  lua lua-devel  luajit luajit-devel  python python-devel  perl perl-devel  perl-ExtUtils-ParseXS  perl-ExtUtils-XSpp  perl-ExtUtils-CBuilder  perl-ExtUtils-Embed

git clone https://github.com/vim/vim.git
cd vim 
./configure --with-features=huge --prefix=/opt/vim  --enable-multibyte  -enable-rubyinterp  --enable-pythoninterp  --enable-perlinterp  --enable-luainterp copy autoload/win.vim for Ctrl-o maximize/restore
make install

# install fonts and fzf
#linux
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
yum install -y the_silver_searcher bat ripgrep
# note bat and ripgrep may not be found

#mac
"cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
"brew install the_silver_searcher bat ripgrep


# setup LSP servers for syntax highlighting
npm i -g svelte-language-server eslint prettier prettier-plugin-svelte
# setup COC plugins

:CocInstall coc-tsserver coc-html coc-css coc-svelte coc-eslint coc-json coc-git
:CocCommand eslint.showOutputChannel
:CocCommand tsserver.showOutputChannel
:CocConfig
"     ~/.v/coc-settings.json                                                                                                                                                                                             X
 {
  "coc.preferences.currentFunctionSymbolAutoUpdate":true
 }

