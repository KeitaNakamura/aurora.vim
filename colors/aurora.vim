highlight clear

if exists('syntax_on')
  syntax reset
endif

set background=dark
let g:colors_name = 'aurora'

let g:aurora#italics      = get(g:, 'aurora#italics', 0)
let g:aurora#smart_cursor = get(g:, 'aurora#smart_cursor', 0)
let g:aurora#focus_effect = get(g:, 'aurora#focus_effect', 0)

" palette
let s:base1 = '#242B36'
let s:base2 = '#29313E'
let s:base3 = '#3D4958'
let s:base4 = '#4D6477'
let s:base5 = '#6C8493'
let s:base6 = '#ADBBC3'
let s:red           = '#CD6B7E'
let s:green         = '#8FB882'
let s:yellow        = '#CEAF65'
let s:blue          = '#709DDE'
let s:purple        = '#B18ADD'
let s:orange        = '#CC815A'
let s:pink          = '#D280A1'
let s:teal          = '#67AFA7'
let s:golden_yellow = '#C2993D'
let s:light_blue    = '#76B2D2'

" neovim terminal colors
if has('nvim')
  let g:terminal_color_0  = s:base1
  let g:terminal_color_1  = s:red
  let g:terminal_color_2  = s:green
  let g:terminal_color_3  = s:yellow
  let g:terminal_color_4  = s:blue
  let g:terminal_color_5  = s:purple
  let g:terminal_color_6  = s:orange
  let g:terminal_color_7  = s:base5
  let g:terminal_color_8  = s:base4
  let g:terminal_color_9  = s:pink
  let g:terminal_color_10 = s:teal
  let g:terminal_color_11 = s:golden_yellow
  let g:terminal_color_12 = s:light_blue
  let g:terminal_color_13 = s:base2
  let g:terminal_color_14 = s:base3
  let g:terminal_color_15 = s:base6
endif

function! s:hi(group, fg, bg, attr)
  let l:attr = a:attr
  if g:aurora#italics == 0 && l:attr ==? 'italic'
    let l:attr = 'none'
  endif

  if !empty(a:fg)
    exec 'hi ' . a:group . ' guifg=' . a:fg
  endif

  if !empty(a:bg)
    exec 'hi ' . a:group . ' guibg=' . a:bg
  endif

  if l:attr != ''
    exec 'hi ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr
  endif
endfun

" Vim Editor
call s:hi('ColorColumn',               '',              s:base2,         '')
call s:hi('CursorColumn',              '',              s:base2,         '')
call s:hi('CursorLine',                '',              s:base2,         'none')
call s:hi('CursorLineNr',              s:light_blue,    s:base2,         'none')
call s:hi('Directory',                 s:blue,          '',              '')
call s:hi('DiffAdd',                   s:green,         s:base2,         'none')
call s:hi('DiffChange',                s:yellow,        s:base2,         'none')
call s:hi('DiffDelete',                s:red,           s:base2,         'none')
call s:hi('DiffText',                  s:blue,          s:base1,         'none')
call s:hi('ErrorMsg',                  s:red,           s:base1,         'bold')
call s:hi('FoldColumn',                s:base5,         s:base2,         '')
call s:hi('Folded',                    s:base4,         s:base1,         '')
call s:hi('Search',                    s:golden_yellow, s:base1,         '')
call s:hi('IncSearch',                 s:golden_yellow, s:base3,         'bold')
call s:hi('CurSearch',                 s:base1, s:golden_yellow,         'bold')
call s:hi('LineNr',                    s:base3,         '',              '')
call s:hi('MatchParen',                s:light_blue,    s:base1,         'underline,bold')
call s:hi('ModeMsg',                   s:green,         '',              '')
call s:hi('MoreMsg',                   s:green,         '',              '')
call s:hi('NonText',                   s:base5,         '',              'none')
call s:hi('Normal',                    s:base6,         s:base1,         'none')
call s:hi('Pmenu',                     s:base6,         s:base2,         '')
call s:hi('NormalFloat',               s:base6,         s:base2,         '') " for neovim
call s:hi('PmenuSbar',                 '',              s:base2,         '')
call s:hi('PmenuSel',                  s:base2,         s:green,         '')
call s:hi('PmenuThumb',                '',              s:base5,         '')
call s:hi('Question',                  s:blue,          '',              'none')
call s:hi('SignColumn',                s:base6,         s:base1,         '')
call s:hi('SpecialKey',                s:base5,         '',              '')
call s:hi('SpellBad',                  s:red,           s:base1,         'underline')
call s:hi('StatusLine',                s:base6,         s:base3,         'none')
call s:hi('StatusLineNC',              s:base2,         s:base5,         '')
call s:hi('TabLine',                   s:base5,         s:base2,         'none')
call s:hi('TabLineFill',               s:base5,         s:base2,         'none')
call s:hi('TabLineSel',                s:yellow,        s:base3,         'none')
call s:hi('Title',                     s:orange,        '',              'none')
call s:hi('Visual',                    s:base6,         s:base3,         '')
call s:hi('WarningMsg',                s:red,           '',              '')
call s:hi('WildMenu',                  s:base2,         s:green,	       '')
call s:hi('VertSplit',                 s:base4,         s:base1,         'none')
call s:hi('WinSeparator',              s:base4,         s:base1,         'none')

if g:aurora#smart_cursor == 1
  call s:hi('Cursor', ''     , ''     , 'inverse')
else
  call s:hi('Cursor', s:base2, s:base6, '')
endif


if g:aurora#focus_effect == 1
  augroup FocusEvent
  autocmd!
  autocmd FocusGained * call s:hi('Normal', s:base6, s:base1, 'none')
  autocmd FocusGained * call s:hi('Folded', s:base4, s:base1, '')
  autocmd FocusLost   * call s:hi('Normal', s:base6, s:base2, 'none')
  autocmd FocusLost   * call s:hi('Folded', s:base4, s:base2, '')
  augroup end
endif

" Standard Syntax
call s:hi('Comment',                   s:base5,         '',         'italic')
call s:hi('Constant',                  s:red,           '',         '')
call s:hi('String',                    s:orange,        '',         '')
call s:hi('Character',                 s:orange,        '',         '')
call s:hi('Identifier',                s:teal,          '',         'none')
call s:hi('Function',                  s:blue,          '',         '')
call s:hi('Statement',                 s:green,         '',         'none')
call s:hi('Exception',                 s:red,           '',         '')
call s:hi('PreProc',                   s:purple,        '',         '')
call s:hi('Define',                    s:purple,        '',         'none')
call s:hi('Macro',                     s:purple,        '',         '')
call s:hi('Type',                      s:yellow,        '',         'none')
call s:hi('StorageClass',              s:teal,          '',         '')
call s:hi('Special',                   s:pink,          '',         '')
call s:hi('Delimiter',                 s:base6,         '',         '')
call s:hi('Underlined',                s:base6,         '',         'underline')
call s:hi('Error',                     s:red,           s:base1,    'bold')
call s:hi('Todo',                      s:base6,         s:base1,    'bold')
call s:hi('Conceal',                   s:golden_yellow, s:base1,    '')

" TeX
call s:hi('texRefZone', s:orange,       '',         '')
call s:hi('texMath',    s:blue,         '',         '')

" Vim-Fugitive
call s:hi('diffAdded',                 s:green,      '',         '')
call s:hi('diffRemoved',               s:red,        '',         '')

" Vim-Gittgutter
call s:hi('GitGutterAdd',              s:green,      '',         '')
call s:hi('GitGutterChange',           s:yellow,     '',         '')
call s:hi('GitGutterDelete',           s:red,        '',         '')
call s:hi('GitGutterChangeDelete',     s:orange,     '',         '')

" indent-guides
call s:hi('IndentGuidesOdd',           '',           s:base2,    '')
call s:hi('IndentGuidesEven',          '',           s:base2,    '')

" coc-nvim
call s:hi('CocSearch', s:golden_yellow, s:base2, '')

" vimtex
hi! link texMathZone Function

" Vim-Signify
hi link SignifySignAdd GitGutterAdd
hi link SignifySignChange GitGutterChange
hi link SignifySignDelete GitGutterDelete
