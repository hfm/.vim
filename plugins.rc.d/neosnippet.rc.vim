imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:neosnippet#snippets_directory = [
      \ '~/.vim/plugged/vim-snippets/snippets',
      \ '~/.vim/plugged/serverspec-snippets',
      \ '~/.vim/plugged/itamae-snippets',
      \ '~/.vim/plugged/terraform-snippets.vim',
      \ ]
let g:neosnippet#enable_conceal_markers=0
augroup ClearMarkers
  autocmd!
  autocmd InsertLeave * NeoSnippetClearMarkers
augroup END
