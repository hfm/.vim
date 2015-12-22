let g:quickrun_config = {
      \   'watchdogs_checker/_' : {
      \       'outputter/quickfix/open_cmd' : '',
      \   },
      \   'ruby/watchdogs_checker' : {
      \       'type' : 'watchdogs_checker/rubocop'
      \   },
      \}
" let g:quickrun_config["watchdogs_checker/puppet"] = {
"       \ "command" : "puppet-lint",
"       \ "exec"    : '%c %o %s:p',
"       \ }
" let g:quickrun_config["puppet/watchdogs_checker"] = {
"       \ "type" : "watchdogs_checker/puppet",
"       \ }

let g:watchdogs_check_CursorHold_enable = 0
let g:watchdogs_check_BufWritePost_enable = 0
let g:watchdogs_check_BufWritePost_enable_on_wq = 0
