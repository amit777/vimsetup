" clear search if you hit enter
"nnoremap <silent> <CR> :nohlsearch<CR><CR>
nnoremap <nowait><silent> <C-C> :noh<CR>

if exists('g:vscode')
" VSCode extension
set updatetime=300
set hlsearch
set incsearch
set wildmode=longest,full " bash-like tab complete"
let g:clever_f_mark_direct = 1

call plug#begin('~/.vim/plugged')
Plug 'tomtom/tcomment_vim'  " the best code commenting tool. gcc toggles
Plug 'AndrewRadev/dsf.vim' " delete surrouning function. note used
Plug 'tpope/vim-fugitive' " git integration
Plug 'tpope/vim-repeat' " makes the dot repeat smarter
Plug 'junegunn/vim-peekaboo'  
Plug 'rhysd/clever-f.vim'
call plug#end()

"nnoremap <silent> K <Cmd>call VSCodeCall('editor.action.showHover')<CR>
"https://code.visualstudio.com/docs/getstarted/keybindings
nnoremap <Leader>qf <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
"autocmd CursorHold * silent call VSCodeNotify('editor.action.showHover')<CR> 

else
syntax on
set nofoldenable
set hlsearch
set incsearch
set equalalways
set timeoutlen=500 " Set timeout length to 500 ms
set ignorecase
set smartcase
set wildmode=longest,full " bash-like tab complete"
set wildmenu " display command tab commplete as menu"
"set linebreak
set foldmethod=syntax
"set foldmethod=indent
noremap <space><space> za
filetype plugin indent on
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set visualbell
set noerrorbells
set showtabline=2
"set clipboard=unnamed
" this use to be vnoremap to *. doesn't work on linux with xclip
vnoremap Y "+y 
set mouse=nvi
set mousemodel=popup

set nocompatible
set laststatus=2
set encoding=UTF-8
set number
"set list - this will show the spaces etc
set lcs+=space:·,eol:⏎

" download from https://www.nerdfonts.com/font-downloads
"set guifont=DroidSansMono\ Nerd\ Font:h14
"set guifont=DejaVuSansMono\ Nerd\ Font\ Mono:h14
set guifont=MesloLGS\ NF:h13
"set guifont=FantasqueSansMono\ Nerd\ Font:h16
" this options makes flickering happen in macvim
" use :!sh instead of :sh
"set guioptions+=! 
set guioptions-=e
let g:csv_start = 1
let g:csv_end = 100

let g:vimwiki_list = [{'path': '~/.vimwiki/'}]

let g:startify_custom_header = [
                  \'ctrl+e+(jkli) winresize | ctr+d open/close shell | gcc gc gcap - comment line, motion, paragraph | %!jq format_json ',
                  \'\e \f \F \s \h \b - explore :GFiles :Files :GitGrep :History :Buffer (c+x/v) split',
                  \'c-o+p c+r" - paste from insert mode. | <C-6> switch to prev edited buffer | :ls list buffers | :b<num or partialname> switch buff',
                  \'dsf, dif - del surr func | daa da, - del argument, comma param | X - del char left | q: - explore old commands | \wt \wd \ws vimwiki | +p or <c+r>+ - paste system clipboard | ctrl+a - inc number | visual g<c+a> increment list |  ciw - change inner word |  zz/zt/zb - recenter middle/top/bottom',
                  \'<c+w><c+w> switch windows | viw St - change surr tag | cs<quote><paren> change surrounding  |  <c+w>o focus/unfocus window',
                  \'ysiw` yank surround inner word backtick   |  \l turn off gutter',
                  \'D - duplicate visual selection  |  <c+d> in :mode shows completions',
                  \'gd gf - go defintion or file  |  \s :GitGrep or :Ag',
                  \'m<UpperCase> global bookmark  |  K get doc'  ,
                  \'gqaj - pretty json under cursor  |  - popup split selector',
                  \'ga or gA - show unicode bin/hex under cursor   |  \1-9 switch in buffer numbers or tabs',
                  \'%s/thee/thee/gc find and replace with confirm  | <space><space> fold code',
                  \'\z or zR - unfold all',
                  \]

let g:startify_custom_footer = [
                  \ ':perldo | :G blame :Gdiff  | :GV! - show git commits of current files. ',
                  \ ':SudoWrite | set list - shows spaces and return | :IndentLinesToggle',
                  \ 'CSV stuff :[Un]ArrangeColumn :Sort[!]<column> :Header :DeleteCol <num>, :WhatCol',
                  \ '\, emmet syntax https://docs.emmet.io/abbreviations/syntax/',
                  \ ':MacroEdit q | vim -Nu NONE | :PlugUpdate :PlugUpgrade :CocUpdate ',
                  \ ' sudo chown -R amit ~/.config; sudo chown -R amit ~/.vim ',
                  \ ':!tidy -mi -html -wrap 0 % -- fixes html from one line'
                  \]

"let g:markbar_num_lines_context = { 'around_local': 1, 'around_file': 1, 'peekaboo_around_local': 1, 'peekaboo_around_file': 1 }
" ditto, but more granularly (any may be omitted)
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
" :G blame show blame
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
" \s - Ag grep.  :.cc over file to open it in quickfix list
"
" ## snippets
" <C-l> expands snippet
" :UltiSnipsEdit  - add a snippet
" syntax stuff https://yufanlu.net/2016/10/30/ultisnips/
" ## DEBUGGER - keybindings: https://github.com/puremourning/vimspector#human-mode
" 
" F5 - start debugger.
" ,di  - put cursor over variable and shows value
" make space bar fold and unfold

let g:startify_session_persistence = 0

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
        \ 'Leader'             :  "m",
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

let g:tagalong_additional_filetypes = ['svelte']

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'charvaluehex' ],
      \             ['coc_info', 'coc_hints', 'coc_errors', 'coc_warnings'], ['coc_status']
      \           ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

let g:lightline#bufferline#show_number = 2

let g:lightline#bufferline#ordinal_number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

let g:lightline#bufferline#enable_devicons = 1

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Tab>   <Plug>lightline#bufferline#go_next()
nmap <S-Tab> <Plug>lightline#bufferline#go_previous()

let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '\'
autocmd FileType html,css,svelte EmmetInstall

if !exists("g:os")
  if has("win64") || has("win32") || has("win16")
    let g:os = "Windows"
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

"let g:closetag_xhtml_filetypes = 'xhtml,jsx,svelte'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.svelte'

let g:peekaboo_window="vert bo 50new"

let g:move_key_modifier = 'C'

" Trigger a highlight in the appropriate direction when pressing these keys:
"let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:clever_f_mark_direct = 1
" this doesn't work to change color
" let g:clever_f_mark_char_color = 'CocLink'

call plug#begin('~/.vim/plugged')
"Plug 'chrisbra/csv.vim' " uncomment to enable csv stuff
if g:os != "Linux"
  "Plug 'semanser/vim-outdated-plugins'
endif
"Plug 'dstein64/vim-startuptime'

"Plug 'cormacrelf/vim-colors-github'
Plug 'pangloss/vim-javascript'
Plug 'liuchengxu/vim-which-key'

Plug 'kien/rainbow_parentheses.vim'
Plug 'amit777/srcery-vim'
Plug 'simeji/winresizer'
Plug 'matze/vim-move'
Plug 'lambdalisue/glyph-palette.vim' " sets up colors on nerdfonts
Plug 'AndrewRadev/dsf.vim' " delete surrouning function. note used
Plug 'dohsimpson/vim-macroeditor'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim' " changes closing tags automatically
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'thinca/vim-visualstar'
Plug 'kshenoy/vim-signature' "seems to cause delays in mark bar opening.
Plug 'mhinz/vim-hugefile'
"Plug 'mhinz/vim-halo'
Plug 'mhinz/vim-janah'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coding tools like intellisense
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " find files and grep contents fast. possible overlap with coc-explorer/coc-lists
Plug 'junegunn/fzf.vim' " explore yuki-yano/fzf-preview.vim as alternative
"Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'rbgrouleff/bclose.vim' " close a buffer with \bd but don't close the split
Plug 'tpope/vim-fugitive' " git integration
"Plug 'tpope/vim-rhubarb' " gbrowse
"Plug 'ap/vim-css-color' " replaced by coc-highlight
"Plug 'preservim/nerdtree' " file explorer. replaced by coc-explorer
Plug 'wellle/targets.vim' " more text objects 
"Plug 'vim-airline/vim-airline' " pretty statusline and tabline
"Plug 'sheerun/vim-polyglot' " syntax detection.  do not use. it slows everything
"Plug 'vim-airline/vim-airline-themes' 
Plug 'ryanoasis/vim-devicons' " show icons in coc-explorer
Plug 'itchyny/lightline.vim'
"Plug 'tpope/vim-obsession'  " replaced by startify sessions
" Track the engine.
"Plug 'SirVer/ultisnips'
"Plug 'jacoborus/tender.vim'
Plug 'tomtom/tcomment_vim'  " the best code commenting tool. gcc toggles
Plug 'tpope/vim-surround' " easily surround stuff with quotes, parens and others
Plug 'airblade/vim-rooter' " changes CWD automatically based on project clues
Plug 'tpope/vim-repeat' " makes the dot repeat smarter
Plug 'mbbill/undotree' " the best undo/redo visualization. I mapped U to toggle this
Plug 'tpope/vim-eunuch' " :SudoWrite :Rename, :Move, :Unlink :Delete :Mkdir :Chmod
"Plug 'tpope/vim-dadbod' " database manipulation"
"Plug 'kristijanhusak/vim-dadbod-ui'
" brew install pyenv (mac m1 processessor requires some latest and greatest
" stuf`f
Plug 'puremourning/vimspector' " for debugger. F5 launches it
" pyenv install 3.9.2
" pyenv global 3.9.2
" nvm install v15.12.0
" brew install vim -vd protobuf
"Plug 'skanehira/docker.vim' 
Plug 'junegunn/vim-peekaboo'  
"Plug 'will133/vim-dirdiff'
Plug 'tmhedberg/matchit'
Plug 'leafOfTree/vim-svelte-plugin' " this seems better at js indent than evanleck/vim-svelte html indent sucks
Plug 't9md/vim-choosewin'
"Plug 'junegunn/gv.vim'
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-characterize'
Plug 'diepm/vim-rest-console'
"Plug 'Yilin-Yang/vim-markbar'
Plug 'alvan/vim-closetag'
Plug 'vimwiki/vimwiki'
Plug 'qpkorr/vim-renamer'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'voldikss/vim-floaterm'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'josa42/vim-lightline-coc'
"Plug 'unblevable/quick-scope' " replacement for clever-f
Plug 'rhysd/clever-f.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'github/copilot.vim'
call plug#end()


" set whichkey
nnoremap <silent> <leader> :WhichKey '\'<CR>

call lightline#coc#register()
let g:one_allow_italics = 1

"let g:markbar_persist_mark_names = v:false

" renamer shows warning about this variable.  but can't seem to define it
"let b:RenamerShowHiddenEnabled = v:true
let g:RenamerSupportColonWToRename = v:true
nmap <Leader>r <Plug>RenamerStart

" these are because i mistype :Q and :Vsplit and :Wq
:command -nargs=* Q q <args> "lbha"
:command -nargs=* Vsplit vsplit <args>
:command -nargs=* Wq wq <args>
:command -nargs=* Qa qa <args>


:command -nargs=* Gbrowse GBrowse <args>
:command -nargs=* Gblame G blame --abbrev=5 --date=relative <args>
:command -nargs=* Blame G blame --abbrev=5 --date=relative <args>

" launch floating terminal
let g:floaterm_keymap_toggle = '<Leader>t'
let g:floaterm_autoclose = 1

let g:prettier#autoformat_require_pragma = 0

" this function is for overriding the default theme colors
" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
" :hi Search  - gets the highlight setting
function! MyHighlights() abort

    " this works with one theme
    " highlight CursorLine   term=underline ctermbg=16 guibg=#282b30

    " this works with janah
    highlight CursorLine   term=underline ctermbg=236 guibg=#242425
    highlight Search       term=reverse ctermfg=7 ctermbg=161 guifg=#fafaff guibg=#70002f
    highlight Todo         ctermfg=DarkRed guifg=DarkRed

    "highlight Comment term=bold cterm=italic ctermfg=59 ctermbg=16 gui=italic guifg=#5c6370 

endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

set t_Co=256
set background=dark
colorscheme janah
"colorscheme onedark
"colorscheme one

" install coc extensions instead of using :CocInstall on each one
let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-css', 
      \ 'coc-eslint', 
      \ 'coc-diagnostic', 
      \ 'coc-emmet', 
      \ 'coc-explorer', 
      \ 'coc-fzf-preview',
      \ 'coc-git',
      \ 'coc-highlight', 
      \ 'coc-html', 
      \ 'coc-html-css-support', 
      \ 'coc-lists', 
      \ 'coc-json', 
      \ 'coc-pairs',
      \ 'coc-perl',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-swagger',
      \ 'coc-sh',
      \ 'coc-svg',
      \ 'coc-svelte', 
      \ 'coc-tsserver', 
      \ 'coc-vimlsp',
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

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

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
  autocmd FileType svelte let b:coc_pairs_disabled = ['<']
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for apply code actions at the cursor position.
"nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer.
"nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for apply refactor code actions.
" nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
" xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
" nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)


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

set noequalalways
let mapleader = '\' "this was comma by default.  changing back to \
let maplocalleader = ","  " this was \<Space>.  changing to ,
let &runtimepath = &runtimepath . ',' . g:vimspector_test_plugin_path

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

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

" let g:airline_filetype_overrides = {
"      \ 'coc-explorer':  [ 'File Explorer', '' ],
"   \ }


" Use preset argument to open it
nnoremap <Leader>e :CocCommand explorer<CR>

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"autocmd BufEnter * call halo#run({'intervals': [20,20,20,20,20], 'shape': 'line'})


" fix for vim sessions not working with coc-explorer
set sessionoptions=curdir,folds,help,slash,tabpages,unix


" Show all diagnostics.

" buffer navigation to specific tabs
" use nmap instead of nnoremap
" nmap <Leader>1 <Plug>AirlineSelectTab1
" nmap <Leader>2 <Plug>AirlineSelectTab2
" nmap <Leader>3 <Plug>AirlineSelectTab3
" nmap <Leader>4 <Plug>AirlineSelectTab4 
" nmap <Leader>5 <Plug>AirlineSelectTab5
" nmap <Leader>6 <Plug>AirlineSelectTab6
" nmap <Leader>7 <Plug>AirlineSelectTab7
" nmap <Leader>8 <Plug>AirlineSelectTab8
" nmap <Leader>9 <Plug>AirlineSelectTab9

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
:set scrolloff=3
" Get to next error.  also type @: to run last command
command! -nargs=0 ErrNext                               :call CocAction('diagnosticNext')<CR>
command! -nargs=0 ErrPrev                               :call CocAction('diagnosticPrevious')<CR>

" invoke window chooser with '-'
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" window lenz functions
"let g:lens#disabled_filetypes = ['coc-explorer', 'fzf']
"let g:lens#animate = 0
"command! Lens :call lens#toggle() 

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
"nnoremap <Leader>f :CocCommand fzf-preview.GitFiles<CR>
nnoremap <Leader>F :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <leader>s  :GAg<cr>
"nnoremap <leader>s  :CocCommand fzf-preview.ProjectGrep .<cr>
nnoremap <leader>h  :History<cr>
nnoremap <leader>H  :Helptags!<cr>

" nmap <Leader>f [fzf-p]
" xmap <Leader>f [fzf-p]
"
" nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
" nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
" nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
" nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
" nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
" nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
" nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
" nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
" nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
" nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
" nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
" xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
" nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
" nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
" nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

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
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" get highlight group under cursor. :call SynGroup()
function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

nnoremap <Leader>sg :call SynGroup()<cr>

nnoremap <Leader>c :Copilot<cr>
" temporarily disable search highlighting 
nnoremap <CR> :noh<CR><CR>

augroup my-glyph-palette
  autocmd!
  autocmd FileType nerdtree,fern,startify,coc-explorer call glyph_palette#apply()
augroup end

" coc completion stuff
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  "commented this out because it makes autocompletion happen when you hit
  "enter
  "inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

  inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ?
    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces

  " ctrl+d opens/closes shell"
noremap <C-d> :sh<cr>

set shm=filnxtToO

" prevent changing lines when clicking into window
augroup NO_CURSOR_MOVE_ON_FOCUS
  au!
  au FocusLost * let g:oldmouse=&mouse | set mouse=
  au FocusGained * if exists('g:oldmouse') | let &mouse=g:oldmouse | unlet g:oldmouse | endif
augroup END

au BufNewFile,BufRead */etc/hosts		setf hostconf

" format JSON
command! -range FormatJson <line1>,<line2>!xargs -0 -I {} node -e 'console.log(JSON.stringify({}, null, 2));'


" augroup fzf_preview
"   autocmd!
"   autocmd User fzf_preview#rpc#initialized call s:fzf_preview_settings() " fzf_preview#remote#initialized or fzf_preview#coc#initialized
" augroup END
"
" function! s:fzf_preview_settings() abort
"   let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
"   let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
" endfunction
endif

function! ToggleDescribeItOnly()
    " Get the current line
    let l:line = getline('.')

    " Define the pattern for 'describe' or 'it' with or without '.only'
    let l:pattern = '\v(describe|it)(\.only)?\('

    " Check if the current line matches the pattern for 'describe' or 'it'
    if l:line =~ l:pattern
        " Check if '.only' is present after 'describe' or 'it'
        if l:line =~ '\v(describe|it)\.only\('
            " Remove '.only'
            let l:line = substitute(l:line, '\v(describe|it)\.only\(', '\1(', '')
        else
            " Add '.only'
            let l:line = substitute(l:line, '\v(describe|it)\(', '\1.only(', '')
        endif

        " Set the modified line
        call setline('.', l:line)
    endif
endfunction

" Bind the function to a key, e.g., <F3>
nnoremap <Leader>o :call ToggleDescribeItOnly()<CR>

