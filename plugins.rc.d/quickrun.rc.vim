let g:quickrun_config = {}
let g:quickrun_config._={
      \  'hook/time/enable': '1',
      \  'outputter/quickfix/into': '1',
      \}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

nmap <silent> <Leader>r <Plug>(quickrun)
