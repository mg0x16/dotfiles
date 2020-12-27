augroup StartFile
  autocmd!
  " When opening a file, jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

augroup SaveFile
  autocmd!
  " Remove Trailing Space
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

augroup VimExit
  autocmd!
  " Restore cursor shape (Vertical Beam)
  autocmd VimLeave * set guicursor=a:ver25
augroup END

augroup FileTypeDetection
  autocmd!
  autocmd BufRead,BufNewFile *.babelrc setfiletype json
  autocmd BufRead,BufNewFile *.eslintrc setfiletype json
  autocmd BufRead,BufNewFile *.tern-config setfiletype json
augroup END

augroup FileTypeSettings
  autocmd!
  autocmd FileType css setlocal shiftwidth=4 softtabstop=4 tabstop=4
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

augroup FileTypeRun
  autocmd!
  autocmd FileType javascript nnoremap <F5> :!node %<cr>
  autocmd FileType python nnoremap <F5> :!python %<cr>
  autocmd FileType rust nnoremap <F5> :!cargo run<cr>
augroup END

