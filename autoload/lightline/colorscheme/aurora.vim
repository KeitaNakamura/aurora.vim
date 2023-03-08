if(exists("g:lightline"))

  " palette
  let s:base1 = '#242B36'
  let s:base2 = '#29313E'
  let s:base3 = '#3A4959'
  let s:base4 = '#567085'
  let s:base5 = '#658595'
  let s:base6 = '#AABBC4'
  let s:red           = '#DC657D'
  let s:green         = '#84B97C'
  let s:yellow        = '#D4AE58'
  let s:blue          = '#639EE4'
  let s:purple        = '#B888E2'
  let s:orange        = '#E18254'
  let s:pink          = '#DC94A2'
  let s:teal          = '#4BB1A7'
  let s:golden_yellow = '#C99720'
  let s:light_blue    = '#72C7D1'

  let s:p = {
        \ 'normal':   {},
        \ 'inactive': {},
        \ 'insert':   {},
        \ 'replace':  {},
        \ 'visual':   {},
        \ 'tabline':  {},
        \ 'command':  {}}

  " [[guifg, guibg, ctermfg, ctermbg], ...]
  let s:p.normal.middle = [
        \ [s:base5, s:base2]]
  let s:p.normal.left = [
        \ [s:base1, s:green],
        \ [s:base6, s:base3]]
  let s:p.normal.right = [
        \ [s:base1, s:base5],
        \ [s:base1, s:base3]]
  let s:p.normal.error = [
        \ [ s:base2, s:red]]
  let s:p.normal.warning = [
        \ [ s:base2, s:yellow]]

  let s:p.inactive.middle = [
        \ [s:base5, s:base2]]
  let s:p.inactive.right = [
        \ [s:base1, s:base3],
        \ [s:base5, s:base2]]
  let s:p.inactive.left = [
        \ [s:base1, s:base3],
        \ [s:base5, s:base2]]

  let s:p.insert.left = [
        \ [s:base1, s:blue],
        \ s:p.normal.left[1]]
  let s:p.replace.left = [
        \ [s:base1, s:red],
        \ s:p.normal.left[1]]
  let s:p.visual.left = [
        \ [s:base1, s:orange],
        \ s:p.normal.left[1]]
  let s:p.command.left = [
        \ [s:base1, s:purple],
        \ s:p.normal.left[1]]

  let s:p.tabline.middle = [
        \ [s:base5, s:base2]]
  let s:p.tabline.right = [
        \ [s:base1, s:base5],
        \ [s:base5, s:base2]]
  let s:p.tabline.left = [
        \ [s:base5, s:base2]]
  let s:p.tabline.tabsel = [
        \ [s:yellow, s:base4]]

  let g:lightline#colorscheme#aurora#palette = lightline#colorscheme#fill(s:p)
endif
