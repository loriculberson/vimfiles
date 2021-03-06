" LiterateVimrc
" =============
" a program that allows you to write CommonMark compatible markdown using
" vimscript inside of codeblocks and run it in Vim as if it were pure
" vimscript.
"
" Maintainer: Tyler Cipriani <tyler@tylercipriani.com>
" License: Copyright (c) Tyler Cipriani - GPL v.3
" Version: 0.0.1~0.0.2-mcmire

if exists("g:loaded_literatevim") || &cp
    finish
endif

let g:loaded_literatevim = 1

" Does a line look like it starts a fenced codeblock?
function! s:starts_codeblock(line) abort
    let line = a:line

    if line =~# '^ *```\( *vim\)\?' && match(line, '```\( *vim\)\?') <=# 3
        return 1
    endif

    if line =~# '^ *\~\~\~\( *vim\)\?' && match(line, '\~\~\~\( *vim\)\?') <=# 3
        return 1
    endif
endfunction

" Does a line look like it ends a fenced codeblock?
function! s:ends_codeblock(line) abort
    let line = a:line

    if line =~# '^ *```' && match(line, '```') <=# 3
        return 1
    endif

    if line =~# '^ *\~\~\~' && match(line, '\~\~\~') <=# 3
        return 1
    endif
endfunction

" Find all CommonMark codeblocks. This supports both fenced codeblocks and
" indented codeblocks and follows the CommonMark 0.27 Spec
" <http://spec.commonmark.org/0.27/>, as well as the GitHub-Flavored Markdown
" (GFM) "spec".
function! s:parse_codeblocks(file) abort
    let lines = []
    let code_block_open = 0
    let last_blank = 0
    let inside_block = 0

    for line in readfile(a:file)
        let start_of_code_block = s:starts_codeblock(line)
        let end_of_code_block = s:ends_codeblock(line)

        if code_block_open ==# 0 && start_of_code_block
            let code_block_open = 1
            continue
        endif

        if code_block_open ==# 1 && end_of_code_block
            let code_block_open = 0
            continue
        endif

        if last_blank ==# 1 && code_block_open ==# 0 && line =~# '^    .*'
            let inside_block = 1
            let line = substitute(line, '^    ', '', '')
        endif

        if code_block_open !=# 1 && inside_block !=# 1
            continue
        endif

        call add(lines, line)

        if line =~# '^$'
            let last_blank = 1
         else
             let last_blank = 0
        endif
    endfor

    let temp = tempname()
    "echo join(lines, "\n")
    call writefile(lines, temp)
    exec "source " . temp
    " Reload all the plugins since this only happens on initialization
    " This does not seem to be necessary, but was during my testing...
    " runtime! plugin/**/*.vim
    call delete(temp)
endfunction


" Entrypoint. Accepts a single path and pases it off for parsing.
function! literatevim#load(path) abort
    call s:parse_codeblocks(a:path)
endfunction
