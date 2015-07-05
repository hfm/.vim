imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> pumvisible() ?
  \ "\<C-n>" : neosnippet#jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:neosnippet#snippets_directory='~/.vim/bundle/serverspec-snippets,~/.vim/bundle/itamae-snippets'

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
