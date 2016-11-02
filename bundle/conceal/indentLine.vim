" Secure Shell on ChromeOS cannot handle fancy UTF-8 symbols
" https://code.google.com/p/chromium/issues/detail?id=278340
if isdirectory('/var/host/cras') && !exists('$SSH_TTY')
  let g:indentLine_char = '|'    " <Bar>
else
  let g:indentLine_char = '│'    " <C-K>vv
endif

" make indent guide lines brighter
let g:indentLine_color_tty_dark = 238
let g:indentLine_color_tty_light = 252

Shortcut toggle indentation lines
      \ nnoremap <silent> <Space>t^ :IndentLinesToggle<Return>
