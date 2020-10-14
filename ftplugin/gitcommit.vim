" ============================================================================
" ftplugin/gitcommit.vim
"
" File type settings for git commit messages (.git/COMMIT_EDITMSG)
" ----------------------------------------------------------------------------

" Always start on the first line in a git commit message.
"
" More info:
" https://vim.fandom.com/wiki/Always_start_on_first_line_of_git_commit_message
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
