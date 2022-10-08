" Setting some decent VIM settings for programming
" This source file comes from git-for-windows build-extra repository (git-extra/vimrc)

syntax on				 " Turn on color syntax highlighting in the vim editor.

ru! defaults.vim                	 " Use Enhanced Vim defaults
set mouse=                      	 " Reset the mouse setting from defaults
aug vimStartup | au! | aug END  	 " Revert last positioned jump, as it is defined below
let g:skip_defaults_vim = 1     	 " Do not source defaults.vim again (after loading this system vimrc)

set ai                          	 " set auto-indenting on for programming
set showmatch                   	 " automatically show matching brackets. works like it does in bbedit.
set vb                          	 " turn on the "visual bell" - which is much quieter than the "audio blink"
set laststatus=2                	 " make the last line where the status is two lines deep so you can see status always
set showmode                    	 " show the current mode
set clipboard=unnamed           	 " set clipboard to unnamed to access the system clipboard under windows
set wildmode=list:longest,longest:full   " Better command line completion
set showcmd				 " Set the number of characters currently selected, the line number or the number of lines and columns displayed in block visual mode.
set wildmenu				 " Set the enhanced mode enabled command line completion display in the vim text editor.

" Set the line number, current line, and distance before and after line display in the vim text editor.
set number				 " Display the line number in the vim text editor.
set relativenumber			 " Current row and distance before and after row distance are displayed.
set number relativenumber

" In the vim text editor, set the row where the highlighted cursor is displayed.
set cursorline				 " Set the underline display in the vim text editor.
set cursorcolumn			 " Sets the cursor row to display.
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

" Setting shortcut Keys
map s :w<CR>                    	 " Use the shortcut S instead of `:` , `w` and `Enter` . 
map Q :q<CR>				 " Use the shortcut Q instead of `:` , `q` and `Enter` .
map R :source $MYVIMRC<CR>		 " Use the shortcut R instead `:` ，`source $MYVIMRC` and `Enter`.

 
" Show EOL type and last modified timestamp, right after the filename
" Set the statusline
set statusline=%f               	 " filename relative to current $PWD
set statusline+=%h              	 " help file flag
set statusline+=%m              	 " modified flag
set statusline+=%r              	 " readonly flag
set statusline+=\ [%{&ff}]      	 " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              	 " Rest: right align
set statusline+=%l,%c%V         	 " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            	 " Position in buffer: Percentage

if &term =~ 'xterm-256color'    " mintty identifies itself as xterm-compatible
  if &t_Co == 8
    set t_Co = 256              " Use at least 256 colors
  endif
  " set termguicolors           " Uncomment to allow truecolors on mintty
endif
"------------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Set UTF-8 as the default encoding for commit messages
    autocmd BufReadPre COMMIT_EDITMSG,MERGE_MSG,git-rebase-todo setlocal fileencoding=utf-8

    " Remember the positions in files with some git-specific exceptions"
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && &filetype !~# 'commit\|gitrebase'
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff" |
      \   exe "normal! g`\"" |
      \ endif

      autocmd BufNewFile,BufRead *.patch set filetype=diff

      autocmd Filetype diff
      \ highlight WhiteSpaceEOL ctermbg=red |
      \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/
endif " has("autocmd")
