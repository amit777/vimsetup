syntax on
set nofoldenable
set hlsearch
set incsearch
set equalalways
set timeoutlen=1000 " Set timeout length to 500 ms
set ignorecase
set smartcase
set foldmethod=syntax
filetype plugin indent on
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set nocompatible
set laststatus=2
set encoding=UTF-8
set number
"set list
set lcs+=space:·,eol:⏎

:let g:csv_start = 1
:let g:csv_end = 100

let g:startify_custom_header = [
                  \'ctrl+a - inc number | visual g<c+a> increment list |  ciw - change inner word |  zz or zt - recenter middle/top',
                  \'<c+w><c+w> switch windows |  ',
                  \' cs<quote><paren> change surrounding  |  <c+w>o focus/unfocus window',
                  \' ysiw` yank surround inner word backtick   |  \l turn off gutter',
                  \' D - duplicate visual selection  |  <c+d> in :mode shows completions',
                  \' gd gf - go defintion or file  |  \/ search gitfiles. or :Ag',
                  \' m<UpperCase> global bookmark  |  K get documentation'  ,
                  \' gqaj - pretty json under cursor  |  - popup split selector',
                  \' ga or gA - show unicode bin/hex under cursor   |  \1-9 switch in buffer numbers or tabs',
                  \' %s/thee/thee/gc find and replace with confirm  | <space><space> fold code',
                  \' \e \f \F \h \b - explore :GFiles :Files :History :Buffer (c+x/v) split',
                  \' \z or zR - unfold all',
                  \' gcc gc gcap - comment line, motion, paragraph',
                  \]

let g:startify_custom_footer = [
                  \ ':Gblame show line blames  | :GV! - show git commits of current files. ',
                  \ ':SudoWrite | set list - shows spaces and return | :IndentLinesToggle',
                  \ 'CSV stuff :[Un]ArrangeColumn :Sort[!]<column> :Header :DeleteCol <num>, :WhatCol',
                  \]

let g:polyglot_disabled = ['svelte'] "using  leafOfTree/vim-svelte-plugin  instead
" ditto, but more granularly (any may be omitted)
let g:markbar_num_lines_context = { 'around_local': 5, 'around_file': 0, 'peekaboo_around_local': 5, 'peekaboo_around_file': 3 }
" make windows equal size after split

"
" https://github.com/romainl/idiomatic-vimrc
" :verbose map <key>  to see what's mapped there
" 
" ## CHEAT SHEET
" zz or zt - recenter to middle or top
" D - duplicate visual mode selected (custom map :vmap D y'>p)
" gf - go to file under cursor
vmap D y'>p
" :Silent <unix command> (runs command without the Hit ENTER to continue)
:command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
" # git stuff
" :GV, :GV! shows git commits.  select them or range of them and "o" to see
"   the diffs
" " or ctrl+r - use vim peekaboo for registerers 
" :Gblame show blame
" R - replace mode
"  ` or ' - Toggle mark bar from Yilin-Yang/vim-markbar
" m<Uppercase> - mark a location in single file. Kinda like global bookmark
" m<lowercase> 'a - mark & go to location.  :'a:'bs/foo/bar.  you can use marks in range 
" "qp  then "qyy - edit macro. edit it.
" gqaj - mouse over json string. pretty print it jdaddy
" gA  - show hex/decimal, binary of number under cursor
" ga - show unicode character under cursor (characterize.vim)
" CTRL-D in command mode shows completions. eg:  :e<ctrl-d>
" %s/thee/the/gc  (as confirmation on global change)
" \e - open file explorer
" \f \F \b \h - run :GFiles :Files, :Buffers :History
"     tab/shift+tab select multiple files. ctrl+v ctrl+x open in splits
" \z or zR - unfold all
" <space> y - brings up advanced yank history. hit Enter to paste selection
" :Ag grep search
" viw (selects word), then St<tag> - surrond selection with tag
" @:  - runs last :command 
" :Lens  - toggles lens resize mode
" za - fold/unfold.  mapped to <space> <space>
" \ve - edit vimrc
" \vs - source vimrc
" gcc, gc, gcap  - comment line, motion, paragraph tpope/vim-commentary plugin
" \h  or :History - opens up window of recent files. fzf
"     ctrl+x/v - opens in horizontal/vertical split
" :ls - list buffers
" bd/bo <num> - delete or open buffer num
" \bd - delete buffer but keep layout
" gd - go to definition of variable or function \f - go to file explorer s - open file in split mode
" <ctrl+w>o - maximize/minimize windows
" <c-w><c-w> switch windows
" K - get documentation about a function/symbol
" \l - toggle gutter line numbers
" \g - show diagnostics pane
" q<letter> start record.  q again. stop.  @@ or  @<letter> replay recording
" .  - redo last motion
"
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
noremap <space><space> za
"set foldmethod=indent
" make space bar fold and unfold

let g:startify_session_persistence = 1

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
" makes startup faster supposedly
let g:startify_enable_unsafe = 1

let g:hugefile_trigger_size = 2 " default 2mb (in MiB)
let g:SignatureMap = {
        \ 'Leader'             :  "t",
        \ 'PlaceNextMark'      :  "",
        \ 'ToggleMarkAtLine'   :  "",
        \ 'PurgeMarksAtLine'   :  "",
        \ 'DeleteMark'         :  "",
        \ 'PurgeMarks'         :  "",
        \ 'PurgeMarkers'       :  "",
        \ 'GotoNextLineAlpha'  :  "",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "",
        \ 'GotoPrevSpotByPos'  :  "",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListBufferMarks'    :  "",
        \ 'ListBufferMarkers'  :  ""
        \ }

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 0
let g:tagalong_additional_filetypes = ['svelte']

call plug#begin('~/.vim/plugged')
"Plug 'chrisbra/csv.vim' " uncomment to enable csv stuff
Plug 'AndrewRadev/tagalong.vim'
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'thinca/vim-visualstar'
Plug 'kshenoy/vim-signature' "seems to cause delays in mark bar opening.
Plug 'mhinz/vim-hugefile'
Plug 'mhinz/vim-halo'
Plug 'mhinz/vim-janah'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " find files and grep contents fast. possible overlap with coc-explorer/coc-lists
Plug 'junegunn/fzf.vim'
Plug 'rbgrouleff/bclose.vim' " close a buffer with \bd but don't close the split
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coding tools like intellisense
Plug 'tpope/vim-fugitive' " git integration
Plug 'ap/vim-css-color' " shows css colors as bg for #<colorcode>
"Plug 'preservim/nerdtree' " file explorer
Plug 'sheerun/vim-polyglot'  " syntax highlighting 
Plug 'vim-airline/vim-airline' " pretty statusline and tabline
"Plug 'rakr/vim-one'  "like atom editor"
Plug 'vim-airline/vim-airline-themes' 
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons' " show icons in coc-explorer
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'tpope/vim-obsession'  " no longer needed. startify does sessions
" Track the engine.
Plug 'SirVer/ultisnips'
Plug 'jacoborus/tender.vim'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'  " ctrl-l completes 
Plug 'tomtom/tcomment_vim'  " the best code commenting tool. gcc toggles
Plug 'tpope/vim-surround' " easily surround stuff with quotes, parens and others
Plug 'airblade/vim-rooter' " changes CWD automatically based on project clues
Plug 'tpope/vim-repeat' " makes the dot repeat smarter
Plug 'mbbill/undotree' " the best undo/redo visualization. I mapped U to toggle this
Plug 'tpope/vim-eunuch' " :Rename, :Move, :Unlink :Delete :Mkdir :Chmod
Plug 'tpope/vim-dadbod' " database manipulation"
Plug 'kristijanhusak/vim-dadbod-ui'
" Plug 'tpope/vim-vinegar' " better netrw. remove nerdtree? netrw is builtin and does scp  
" brew install pyenv (mac m1 processessor requires some latest and greatest
" stuff
" pyenv install 3.9.2
" pyenv global 3.9.2
" nvm install v15.12.0
" brew install vim -vd protobuf
Plug 'puremourning/vimspector' " for debugger. F5 launches it
"Plug 'skanehira/docker.vim' 
Plug 'junegunn/vim-peekaboo'  
Plug 'will133/vim-dirdiff'
Plug 'leafOfTree/vim-svelte-plugin' " this seems better at js indent than evanleck/vim-svelte". html indent sucks
"Plug 'burner/vim-svelte' " this kinda stinks. just leaving note so avoid it
Plug 'voldikss/vim-floaterm' "Floating terminal.  will play with it later
Plug 'powerman/vim-plugin-AnsiEsc' "add ability to render ansi colors for log files etc
Plug 't9md/vim-choosewin'
"Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'junegunn/gv.vim'
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-characterize'
Plug 'diepm/vim-rest-console'
Plug 'Yilin-Yang/vim-markbar'
"Plug 'tpope/vim-afterimage' "doesn't seem to work right
"Plug 'junegunn/limelight.vim' " neat but not needed
"Plug 'junegunn/vim-github-dashboard' " neat but not quite there
call plug#end()

" these are because i mistype :Q and :Vsplit and :Wq
:command -nargs=* Q q <args>
:command -nargs=* Vsplit vsplit <args>
:command -nargs=* Wq Wq <args>

" launch floating terminal
let g:floaterm_keymap_toggle = '<Leader>t'
let g:floaterm_autoclose = 1

let g:prettier#autoformat_require_pragma = 0

" this function is for overriding the default theme colors
" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
" :hi Search  - gets the highlight setting
function! MyHighlights() abort
    highlight CocHighlightText  ctermbg=17        guibg=#494949
    highlight Search       term=reverse ctermfg=7 ctermbg=161 guifg=#fafaff guibg=#70002f
    highlight Normal       ctermfg=253 guifg=#dadada guibg=#20201D
    "highlight Visual     cterm=NONE ctermbg=76  ctermfg=16  gui=NONE guibg=#5fd700 guifg=#000000
    "highlight StatusLine cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#d70000
    "highlight NonText    cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

set background=dark
"colorscheme tender
colorscheme janah
let g:airline_theme='tender'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ctrlspace_show_tab_nr = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline#extensions#tabline#formatter = 'tabnr'
"let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
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
      \ 'coc-clangd',
      \ 'coc-css', 
      \ 'coc-eslint', 
      \ 'coc-explorer', 
      \ 'coc-json', 
      \ 'coc-git',
      \ 'coc-prettier',
      \ 'coc-swagger',
      \ 'coc-python',
      \ 'coc-snippets',
      \ 'coc-svelte', 
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

" Formatting selected code.
vmap <leader>f  <Plug>(coc-format-selected)
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
nnoremap <Leader>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
autocmd BufEnter * call halo#run({'intervals': [20,20,20,20,20], 'shape': 'line'})


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


" make it easy to edit vimrc file
:nnoremap <leader>ve :vsplit $MYVIMRC<CR>
:nnoremap <leader>vs :source $MYVIMRC<CR>

" Fix up code while typing
augroup formatgroup
    autocmd!
    autocmd FileType html setlocal foldmethod=indent
"    autocmd! InsertLeave *.svelte  call CocAction('format')
"    autocmd! InsertLeave *.js  call CocAction('format')
"    autocmd! InsertLeave *.css  call CocAction('format')
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

au BufRead * normal zR

" set scroll offset context so search results don't appear at bottom
:set scrolloff=5
" Get to next error.  also type @: to run last command
command! -nargs=0 ErrNext                               :call CocAction('diagnosticNext')<CR>
command! -nargs=0 ErrPrev                               :call CocAction('diagnosticPrevious')<CR>

" invoke window chooser with '-'
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" window lenz functions
let g:lens#disabled_filetypes = ['coc-explorer', 'fzf']
"let g:lens#animate = 0
command! Lens :call lens#toggle() 

set grepprg=ag\ --vimgrep

" unfold all
nnoremap <Leader>z zR

" make FZF grep through gitfiles
command! -bang -nargs=* GAg
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>). ' ":(exclude)yarn.lock"', 0,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--no-hscroll'},'up:60%')
  \           : fzf#vim#with_preview({'options': '--no-hscroll'},'right:50%'),
  \   <bang>0)

nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>F :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <leader>/  :GAg<cr>
nnoremap <leader>h  :History<cr>
nnoremap <leader>H  :Helptags!<cr>

" TODO: add this to make JS object multiline
" "in after/ftplugin/javascript.vim
" function! SingleToMulti() abort
"     normal 0
"     call search('[\[({]', 'c', line('.'))
"     let char = getline('.')[col('.')-1]
"     execute "normal! ci" . char . "\<CR>\<CR>\<Up>\<C-r>\""
"     s/ *$/,
"     s/, /,\r
"     execute "normal =i" . char
" endfunction
" nnoremap <buffer> ,m :<C-u>silent call SingleToMulti()<CR>
