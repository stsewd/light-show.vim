function! s:nextSlide(direction)
  " Search header
  let @/ = '-\{3,}'
  silent execute 'normal! '.a:direction

  " Center screen
  normal! zt

  " Scroll one line
  execute "normal! \<C-E>"

  " Refresh screen
  redraw!
endfunction

function! s:startPresentation()
  let l:nlines = get(g:, 'light_show_nlines', 15) - 1
  execute 'Goyo x'.l:nlines
  " Put current slide on the center
  call <SID>nextSlide('n')
  call <SID>nextSlide('2N')
endfunction


function! s:goyoEnter()
  " Disable disturbing settings
  setlocal nospell
  set scrolloff=0
  
  " Deactivate Limelight
  if exists('g:loaded_limelight')
    Limelight!
  endif

  " Force conceallevel=2
  let g:vim_markdown_conceal = 2
  set conceallevel=2
  syntax enable

  " Set mappings
  nnoremap <buffer><silent> n :call <SID>nextSlide('n')<CR>
  nnoremap <buffer><silent> p :call <SID>nextSlide('2N')<CR>
  nnoremap <buffer><silent> <Backspace> :Goyo!<CR>
endfunction

function! s:goyoLeave()
  nunmap <buffer> n
  nunmap <buffer> p
  nunmap <buffer> <Backspace>
endfunction


" Autocommands for Goyo
augroup VimShowAuGroup
  autocmd!
  autocmd User GoyoEnter nested call <SID>goyoEnter()
  autocmd User GoyoLeave nested call <SID>goyoLeave()
augroup END

command! StartPresentation :call <SID>startPresentation()
nnoremap <buffer><silent> <CR> :StartPresentation<CR>
