let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1

" make matching portions of candidates easier to discern
highlight default link uniteCandidateInputKeyword Search

" prevent `Unite -no-split` from populating the <C-O> / <C-I> jumplist
" https://github.com/Shougo/unite.vim/issues/278#issuecomment-24491066
autocmd BufLeave \[unite\]* if "nofile" ==# &buftype | setlocal bufhidden=wipe | endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  setlocal nopaste " make sure insert mode works correctly when paste is on
  nmap <silent> <buffer> <C-C> <Plug>(unite_exit)
  imap <silent> <buffer> <C-C> <Plug>(unite_insert_leave)<Bar><Plug>(unite_exit)
  imap <silent> <buffer> <C-J> <Plug>(unite_select_next_line)
  imap <silent> <buffer> <C-K> <Plug>(unite_select_previous_line)
  imap <silent> <buffer> <C-R> <Plug>(unite_narrowing_input_history)
  imap <silent> <buffer> <C-W> <Plug>(unite_delete_backward_path)
endfunction

autocmd VimEnter * call s:unite_setup_once()
function! s:unite_setup_once()

  " use fuzzy matching by default for most Unite sources
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#custom#source('line', 'matchers', 'matcher_fuzzy')

  " ignore certain files and directories while searching
  call unite#custom_source('file,file_rec,file_rec/async,grep',
        \ 'ignore_pattern', join([
        \ '\.git/',
        \ '\.bundle/',
        \ '\.rubygems/',
        \ 'vendor/',
        \ '_build/',
        \ 'deps/',
        \ ], '\|'))

endfunction

Shortcut (unite) go to section in buffer outline
      \ nnoremap <silent> <Space>`b :Unite -no-split outline<Return>

Shortcut (unite) go to buffer or file in git/history
      \ nnoremap <silent> <Space>'b :Unite -no-split buffer file/vcs file_mru<Return>

Shortcut (unite) go to file in directory
      \ nnoremap <silent> <Space>Of :Unite -no-split file file/new<Return>

Shortcut (unite) go to relative file in directory
      \ nnoremap <silent> <Space>of :UniteWithBufferDir -no-split file file/new<Return>

Shortcut (unite) go to file in git/history/directory
      \ nnoremap <silent> <Space>'f :Unite -no-split file/vcs file_mru file_rec/async<Return>

Shortcut (unite) go to relative file in git/history/directory
      \ nnoremap <silent> <Space>`f :UniteWithBufferDir -no-split file/vcs file_mru file_rec/async<Return>

Shortcut (unite) go to file in git
      \ nnoremap <silent> <Space>'g :Unite -no-split file/vcs<Return>

Shortcut (unite) go to tab
      \ nnoremap <silent> <Space>'t :Unite -no-split tab<Return>

Shortcut (unite) command prompt
      \ nnoremap <Space>:u :Unite -no-split<Space>

Shortcut (unite) go to mark or jump in buffer
      \ nnoremap <silent> <Space>'m :Unite -no-split mark jump<Return>

Shortcut (unite) repeat command from history
      \ nnoremap <silent> <Space>': :Unite -no-split command<Return>

Shortcut (unite) repeat filter from history
      \ nnoremap <silent> <Space>e! :Unite -no-split launcher<Return>

Shortcut (unite) apply spelling suggestion
      \ nnoremap <silent> <Space>es :Unite -no-split spell_suggest<Return>

Shortcut (unite) paste from register
      \ nnoremap <silent> <Space>'r :Unite -no-split register<Return>

Shortcut (unite) go to ctag in any buffer
      \ nnoremap <silent> <Space>'] :Unite -no-split tag<Return>

Shortcut (unite) go to line in buffer matching word at cursor
      \ nnoremap <silent> <Space>'* :UniteWithCursorWord -no-split -immediately line<Return>

Shortcut (unite) go to line in buffer
      \ nnoremap <silent> <Space>'l :Unite -no-split line<Return>

Shortcut (unite) go to window
      \ nnoremap <silent> <Space>'w :Unite -no-split window<Return>
