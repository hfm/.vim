" vim-smartinput
"http://studio.tgl.jp/blog/?p=1835
call smartinput#map_to_trigger('i', '%', '%', '%')
call smartinput#define_rule({
      \   'at': '<\%#', 'char': '%', 'input': '%%',
      \ })
call smartinput#define_rule({
      \   'at': '%.*\%#%', 'char': '%', 'input': '',
      \ })
