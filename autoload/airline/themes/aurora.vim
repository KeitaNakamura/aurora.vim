let g:airline#themes#aurora#palette = {}

function! airline#themes#aurora#refresh()
    let g:airline#themes#aurora#palette.accents = {
                \ 'red': airline#themes#get_highlight('Error'),
                \ }

    let s:N1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Statement', 'fg'], 'none')
    let s:N2 = airline#themes#get_highlight('Pmenu')
    let s:N3 = airline#themes#get_highlight('FoldColumn')
    let g:airline#themes#aurora#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

    let group = airline#themes#get_highlight('Type')
    let g:airline#themes#aurora#palette.normal_modified = {
                \ 'airline_c': [ group[0], '', group[2], '', '' ]
                \ }

    let s:I1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Function', 'fg'], 'none')
    let g:airline#themes#aurora#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
    let g:airline#themes#aurora#palette.insert_modified = g:airline#themes#aurora#palette.normal_modified

    let s:R1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Error', 'fg'], 'none')
    let g:airline#themes#aurora#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)
    let g:airline#themes#aurora#palette.replace_modified = g:airline#themes#aurora#palette.normal_modified

    let s:V1 = airline#themes#get_highlight2(['Normal', 'bg'], ['String', 'fg'], 'none')
    let g:airline#themes#aurora#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:N3)
    let g:airline#themes#aurora#palette.visual_modified = g:airline#themes#aurora#palette.normal_modified

    let s:IA = airline#themes#get_highlight2(['NonText', 'fg'], ['CursorLine', 'bg'])
    let g:airline#themes#aurora#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
    let g:airline#themes#aurora#palette.inactive_modified = g:airline#themes#aurora#palette.normal_modified

    if get(g:, 'loaded_ctrlp', 0)
        let g:airline#themes#aurora#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
                    \ airline#themes#get_highlight('CursorLine'),
                    \ airline#themes#get_highlight2(['Operator', 'fg'], ['Normal', 'bg']),
                    \ airline#themes#get_highlight2(['Normal', 'bg'], ['Operator', 'fg']))
    endif
endfun

call airline#themes#aurora#refresh()
