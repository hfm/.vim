" vim-flake8
let g:flake8_builtins="_,apply"
autocmd BufWritePost *.py call Flake8()
let g:syntastic_python_checkers=['flake8']
