" File: rando.vim
" Author: Sam Koepnick <sam@koepnick.io>
" Version: 1.0
" Last Modified: 2019-03-23 
" Description: Generates a random string and places it in the buffer
" Usage:
"   Normal Mode
"     Rando n

function! s:Rando(...)
    let len = get(a:, 1, 20)
    let rand = system('dd if=/dev/urandom bs=1 count='.len.' status=none | base64 ')
    let @z = substitute(rand, '\n\+$', '', '')
    execute 'normal! "zp'
    echom 'Random number copied to @z'
endfunction

command! -nargs=1 Rando call s:Rando(<f-args>)
