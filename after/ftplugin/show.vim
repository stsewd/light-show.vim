function! s:nextSlide(direction)
  " Search header
  let @/ = '-\{3,}'
  silent execute 'normal! '.a:direction

  " Clear search
  nohlsearch

  " Center screen
  normal! zt

  " Scroll one line
  execute "normal! \<C-E>"
endfunction

function! s:startPresentation()
  let l:light_show_lines = 15 - 1
  execute 'Goyo x'.l:light_show_lines
  " Put current slide on the center
  call <SID>nextSlide('n')
  call <SID>nextSlide('2N')
endfunction


function! s:goyo_enter()
  " Disable disturbing settings
  setlocal nospell
  set scrolloff=0
  
  " Deactivate Limelight
  Limelight!

  " Force conceallevel=2
  let g:vim_markdown_conceal = 2  " Hide symbols
  set conceallevel=2
  syntax enable

  " Set mappings
  nnoremap <buffer><silent> n :call <SID>nextSlide('n')<CR>
  nnoremap <buffer><silent> p :call <SID>nextSlide('2N')<CR>
  nnoremap <buffer><silent> <Backspace> :Goyo!<CR>
endfunction

function! s:goyo_leave()
  nunmap <buffer> n
  nunmap <buffer> p
  nunmap <buffer> <Backspace>
endfunction


" Autocommands for Goyo
augroup VimShowAuGroup
  autocmd!
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END

command! StartPresentation :call <SID>startPresentation()
nnoremap <buffer><silent> <CR> :StartPresentation<CR>
