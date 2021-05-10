let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'files',     'header': ['   Files']            },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ ]

let g:startify_enable_special = 0
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_dir = '.session'

let g:startify_bookmarks = [
    \ {'i': '~/.vim'},
    \]

let g:startify_custom_header = [
    \ '          _                               ',
    \ '    _   _| | ___   _  ___  _   _ ____     ',
    \ '   | | | | |/ / | | |/ _ \| | | |_  /     ',
    \ '   | |_| |   <| |_| | (_) | |_| |/ /      ',
    \ '    \__,_|_|\_\\__, |\___/ \__,_/___|____ ',
    \ '               |___/               |_____|',
    \ ]


