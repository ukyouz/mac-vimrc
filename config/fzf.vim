set rtp+=/usr/local/opt/fzf
let g:fzf_layout = {'down': '~33%'}
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --threads 8 --column --line-number --no-heading -t'.expand('%:e').' --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--oneline --color=always'
" nnoremap <Leader>p :Files<CR>
" nnoremap <Leader>r :Rg<CR>
" vnoremap <Leader>r y:Rg <C-r>"<CR>
if has("nvim")
augroup fzf_esc_mapping
  autocmd!
  autocmd! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  autocmd! FileType fzf tnoremap <buffer> <Esc> <c-c>
augroup END
endif
