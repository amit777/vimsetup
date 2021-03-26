""" Zoom window: save and restore window layout
" copy follow nnoremap to main .vimrc for it to take effect
"nnoremap <silent> <C-w>o :call win#zoom_toggle()<CR>
"" <C-w>o zoom window (there should be only 1 window)
"" <C-w>o restores previous windows
func! win#zoom_toggle() abort
    if winnr('$') == 1 && get(t:, "zoomed", v:false)
        call s:layout_restore()
        let t:zoomed = v:false
    else
        let t:zoomed = v:true
        call s:layout_save()
        silent wincmd o
    endif
endfunc


func! s:layout_save(...) abort
    let t:zoom_winrestcmd = winrestcmd()
    let t:zoom_layout = winlayout()
    let t:zoom_cursor = [winnr(), getcurpos()]
    call s:add_buf_to_layout(t:zoom_layout)
endfunc


func! s:layout_restore() abort
    if empty(get(t:, "zoom_layout", []))
        return
    endif

    " Close other windows
    silent wincmd o

    " recursively restore buffers
    call s:apply_layout(get(t:, "zoom_layout"))

    " resize
    exe t:zoom_winrestcmd

    " goto saved window
    exe printf("%dwincmd w", t:zoom_cursor[0])

    " set cursor
    call setpos('.', t:zoom_cursor[1])
endfunc

" add bufnr to leaf
func! s:add_buf_to_layout(layout) abort
    if a:layout[0] ==# 'leaf'
        " replace win_id with buffer number
        let a:layout[1] = winbufnr(a:layout[1])
    else
        for child_layout in a:layout[1]
            call s:add_buf_to_layout(child_layout)
        endfor
    endif
endfunc


func! s:apply_layout(layout) abort
    if a:layout[0] ==# 'leaf'
        " load buffer for leaf
        if bufexists(a:layout[1])
            exe printf('b %d', a:layout[1])
        endif
    else
        " split cols or rows, split n-1 times
        let split_method = a:layout[0] ==# 'col' ? 'rightbelow split' : 'rightbelow vsplit'
        let wins = [win_getid()]
        for child_layout in a:layout[1][1:]
            exe split_method
            let wins += [win_getid()]
        endfor

        " recursive into child windows
        for index in range(len(wins) )
            call win_gotoid(wins[index])
            call s:apply_layout(a:layout[1][index])
        endfor
    endif
endfunc

" toggle line numbers and sign colum
func! win#toggle_gutter() abort
    if get(t:, "togglegutter")
        set number
        set signcolumn=number
        let t:togglegutter = v:false
    else
        set nonumber
        set signcolumn=no
        let t:togglegutter = v:true
    endif
endfunc
