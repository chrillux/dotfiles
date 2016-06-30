syntax on
set et
set sw=4
set smarttab
set bg=dark

" svn diff during commit
autocmd BufReadPost svn-commit*.tmp :call Svn_diff()
function! Svn_diff()
    silent exe "normal G"
    silent r!svn diff
    silent exe "1"
endfunction

" See those extra whitespaces
autocmd BufReadPre * :call matchadd('Error', '\s\+$', -1) | call matchadd('Error', '\%u00A0')
