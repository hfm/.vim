" vim-flake8
let g:flake8_builtins="_,apply"
autocmd BufWritePost *.py call Flake8()
