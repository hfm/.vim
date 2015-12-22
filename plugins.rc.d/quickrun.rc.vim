let g:quickrun_config = {}
let g:quickrun_config._={
      \  'runner': 'vimproc',
      \  'runner/vimproc/updatetime': 60,
      \  'hook/time/enable': '1',
      \  'outputter/buffer/split': ':botright 10sp',
      \}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

nmap <silent> <Leader>r <Plug>(quickrun)
