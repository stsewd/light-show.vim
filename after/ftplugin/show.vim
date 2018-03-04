let s:light_show_lines = 15 + 2

function! s:goyo_enter()
  setlocal nospell
  nmap <buffer><silent> n /#<cr>:set nohlsearch<cr>zt
  nmap <buffer><silent> p ?#<cr>:set nohlsearch<cr>zt
endfunction

function! s:goyo_leave()
  nunmap <buffer> n
  nunmap <buffer> p
endfunction

augroup VimShowAuGroup
  autocmd!
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END

command StartPresentation execute 'Goyo x'.s:light_show_lines
