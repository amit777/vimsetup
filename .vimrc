let g:polyglot_disabled = ['svelte']
"
" :verbose map <key>  to see what's mapped there
" ## CHEAT SHEET
" \ev - edit vimrc
" \sv - source vimrc
" gcc, gc, gcap  - comment line, motion, paragraph tpope/vim-commentary plugin
" \h  or :History - opens up window of recent files. fzf
"     ctrl+x/v - opens in horizontal/vertical split
" :Obsession <name> turn on session saving - open session with vim -S <name>
" :ls - list buffers
" bd/bo <num> - delete or open buffer num
" \bd - delete buffer but keep layout
" gd - go to definition of variable or function \f - go to file explorer s - open file in split mode
" <ctrl+w>o - maximize/minimize windows
" K - get documentation about a function/symbol
" \l - toggle gutter line numbers
" \g - show diagnostics pane
" q<letter> start record.  q again. stop.  @<letter> replay recording
" .  - redo last motion
"
" :Obsession <name/dir> record session and auto save. vim -S Session.vim to
" cs'"  - changes surrounding single quotes to double
" ysiw`  - yank surround innerword with backtick
" \/ - Ag grep.  :.cc over file to open it in quickfix list
"
" ## snippets
" <C-l> expands snippet
" :UltiSnipsEdit  - add a snippet
" syntax stuff https://yufanlu.net/2016/10/30/ultisnips/
" ## DEBUGGER - keybindings: https://github.com/puremourning/vimspector#human-mode
" 
" F5 - start debugger.
" ,di  - put cursor over variable and shows value
syntax on
set timeoutlen=1000 " Set timeout length to 500 ms
set ignorecase
set smartcase


" Move around windows with Ctrl-j rather than Ctrl+W then j
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

filetype plugin indent on
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set nocompatible
set laststatus=2
set encoding=UTF-8
set number
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " find files and grep contents fast. possible overlap with coc-explorer/coc-lists
Plug 'junegunn/fzf.vim'
Plug 'rbgrouleff/bclose.vim' " close a buffer with \bd but don't close the split
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coding tools like intellisense
Plug 'tpope/vim-fugitive' " git integration
Plug 'ap/vim-css-color' " shows css colors as bg for #<colorcode>
"Plug 'preservim/nerdtree' " file explorer
Plug 'sheerun/vim-polyglot'  " syntax highlighting 
Plug 'vim-airline/vim-airline' " pretty statusline and tabline
"Plug 'joshdick/onedark.vim' " theme that looks like VSCode
Plug 'rakr/vim-one'  "like atom editor"
Plug 'vim-airline/vim-airline-themes' 
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons' " show icons in coc-explorer
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-obsession'  " Call :Obsess <optional file/dir name>
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'  " ctrl-l completes 
Plug 'tomtom/tcomment_vim'  " the best code commenting tool. gcc toggles
Plug 'tpope/vim-surround' " easily surround stuff with quotes, parens and others
Plug 'airblade/vim-rooter' " changes CWD automatically based on project clues
Plug 'tpope/vim-repeat' " makes the dot repeat smarter
Plug 'mbbill/undotree' " the best undo/redo visualization. I mapped U to toggle this
Plug 'tpope/vim-eunuch' " :Rename, :Move, :Unlink :Delete :Mkdir :Chmod
" Plug 'tpope/vim-vinegar' " better netrw. remove nerdtree? netrw is builtin and does scp  
" brew install pyenv (mac m1 processessor requires some latest and greatest
" stuff
" pyenv install 3.9.2
" pyenv global 3.9.2
" nvm install v15.12.0
" brew install vim -vd protobuf
Plug 'puremourning/vimspector' " for debugger. F5 launches it
Plug 'skanehira/docker.vim' 
Plug 'will133/vim-dirdiff'
Plug 'leafOfTree/vim-svelte-plugin' " this seems better at js indent than evanleck/vim-svelte". html indent sucks
"Plug 'burner/vim-svelte' " this kinda stinks. just leaving note so avoid it
"Plug 'voldikss/vim-floaterm' "Floating terminal.  will play with it later
call plug#end()

let g:prettier#autoformat_require_pragma = 0

"colorscheme onedark
set background=dark
colorscheme one
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

" for making sure indent works fine with svelte
"let g:svelte_indent_script = 0
"let g:svelte_indent_style = 0

"let NERDTreeShowBookmarks=1
let g:session_autosave = 'no'

" install coc extensions instead of using :CocInstall on each one
let g:coc_global_extensions = [
      \ 'coc-tsserver', 
      \ 'coc-lists', 
      \ 'coc-html', 
      \ 'coc-css', 
      \ 'coc-explorer', 
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
      \ 'coc-pairs',
      \ 'coc-yank',
\ ]

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code. (commented this out because I want nerd tree to
" load with this
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,javascript,svelte setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" function enhance status line. Add %{StatusDiagnostic()} to your 'statusline' option.
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

" this function is defined in autoload/win.vim
nnoremap <silent> <C-w>o :call win#zoom_toggle()<CR>


"shows/hides gutter line numbers and warnings
nnoremap <silent> <leader>l :call win#toggle_gutter()<CR>
nnoremap <silent> <leader>g :CocDiagnostics<CR>

" expand snippet from coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
" this does the same thing as above. <tab> is default but it messes with Coc
" variable completion
let g:UltiSnipsExpandTrigger="<C-l>"


" setup vimspector
" :VimspectorUpdate to update gadgets
let g:vimspector_test_plugin_path = expand( '<sfile>:p:h:h' )
" https://github.com/puremourning/vimspector#human-mode see key bindings
let g:vimspector_enable_mappings='HUMAN'
" customize the UI to add Fkeys
function! s:CustomiseWinBar()
  call win_gotoid( g:vimspector_session_windows.code )
  " Clear the existing WinBar created by Vimspector
  nunmenu WinBar
  nnoremenu WinBar.■\ Stop\(F3\) :call vimspector#Stop( { 'interactive': v:false } )<CR>
  nnoremenu WinBar.▶\ Cont\(F5\) :call vimspector#Continue()<CR>
  nnoremenu WinBar.▷\ Pause\(F6\) :call vimspector#Pause()<CR>
  nnoremenu WinBar.↷\ Next\(F10\) :call vimspector#StepOver()<CR>
  nnoremenu WinBar.→\ Step\(F11\) :call vimspector#StepInto()<CR>
  nnoremenu WinBar.←\ Out\(F12\) :call vimspector#StepOut()<CR>
  nnoremenu WinBar.⟲:\(F4\) :call vimspector#Restart()<CR>
  nnoremenu WinBar.✕ :call vimspector#Reset( { 'interactive': v:false } )<CR>
  " Cretae our own WinBar
endfunction

augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call s:CustomiseWinBar()
augroup END

"set mouse=a  " amit777 commented out this to focus on using keybindings.
"mouse stuff was causing copy/paste issues
set noequalalways
let mapleader = '\' "this was comma by default.  changing back to \
let maplocalleader = ","  " this was \<Space>.  changing to ,
let &runtimepath = &runtimepath . ',' . g:vimspector_test_plugin_path

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

"You may also wish to add mappings for up/down the stack, for example:
nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame

" add tcomment_vim for svelte
let g:tcomment#filetype#guess_svelte = 'html'

nnoremap U :UndotreeToggle<CR>

" coc-explorer
function! s:explorer_cur_dir()
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  return fnamemodify(node_info['fullpath'], ':h')
endfunction

function! s:exec_cur_dir(cmd)
  let dir = s:explorer_cur_dir()
  execute 'cd ' . dir
  execute a:cmd
endfunction

let g:airline_filetype_overrides = {
     \ 'coc-explorer':  [ 'File Explorer', '' ],
  \ }


" Use preset argument to open it
nnoremap <leader>f :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" fix for vim sessions not working with coc-explorer
set sessionoptions=curdir,folds,help,slash,tabpages,unix


" Show all diagnostics.

" buffer navigation to specific tabs
" use nmap instead of nnoremap
nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4 
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9



" Tab navigation to specific tabs
nnoremap <Leader>t1 1gt
nnoremap <Leader>t2 2gt
nnoremap <Leader>t3 3gt
nnoremap <Leader>t4 4gt
nnoremap <Leader>t5 5gt
nnoremap <Leader>t6 6gt
nnoremap <Leader>t7 7gt
nnoremap <Leader>t8 8gt
nnoremap <Leader>t9 9gt


nnoremap <leader>/  :<C-u>Ag<cr>
nnoremap <leader>h  :History<cr>

" make it easy to edit vimrc file
:nnoremap <leader>ev :vsplit $MYVIMRC<CR>
:nnoremap <leader>sv :source $MYVIMRC<CR>

" Fix up code while typing
augroup formatgroup
    autocmd!
    autocmd! InsertLeave *.svelte  call CocAction('format')
    autocmd! InsertLeave *.js  call CocAction('format')
    autocmd! InsertLeave *.css  call CocAction('format')
augroup END

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" reopen file in last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

