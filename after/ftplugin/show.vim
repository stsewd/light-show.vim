let s:light_show_lines = 15 + 2

function! s:goyo_enter()
  setlocal nospell
  set scrolloff=0
  Limelight!

  nnoremap <buffer><silent> n /-\{3,}<cr>:set nohlsearch<cr>zt1<C-E>
  nnoremap <buffer><silent> p ?-\{3,}<cr>n:set nohlsearch<cr>zt1<C-E>
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
