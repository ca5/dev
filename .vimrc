""""""""""""""""""""""""""
" Neobundle
""""""""""""""""""""""""""
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'kannokanno/previm'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'vim-scripts/visSum.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'python_fold'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'heavenshell/vim-slack'
NeoBundle 'mattn/webapi-vim'
call neobundle#end()
filetype plugin indent on


filetype on
let g:neobundle#log_filename = $HOME . "/neobundle.log"


""""""""""""""""""""""""""
" Neobundle Packages
""""""""""""""""""""""""""
"indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444444 ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#555555 ctermbg=234
let g:indent_guides_guide_size = 1

"neocomplcache
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : ''
"        \ }
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplcache#smart_close_popup() . "\<CR>"
"endfunction
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()




"jedi-vim
"if g:jedi#popup_on_dot
"  inoremap <buffer> ..<C-R>=jedi#do_popup_on_dot() ? "\<lt>C-X>\<lt>C-O>\<lt>C-P>" : ""<CR>
"end
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_function_definition = 0

"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#auto_vim_configuration = 0
"if !exists('g:neocomplete#force_omni_input_patterns')
"        let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

"neocomplete
let g:neocomplete_enable_at_startup = 1
let g:neocomplete_enable_smart_case = 1
let g:neocomplete_min_syntax_length = 3
let g:neocomplete_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete_dictionary_filetype_lists = {
    \ 'default' : ''
        \ }

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()



"QFixHowm
let howm_dir = '~/qfixmemo/data'
"let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'
"let QFixHowm_GenerateFile = '%Y-%m-%d-%H%M%S.md'
"let qfixmemo_diary     = 'diary/%Y/%m/%Y-%m-%d.md'
let QFixHowm_FoldingPattern = '^[#+] .*'
let QFixHowm_FileType = 'markdown'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
let QFixHowm_Title = '#'
let QFixHowm_Key = 'g'
let GoogleCL = 'google'

"taglist
"set tags = tags
let Tlist_Ctags_Cmd = "/usr/local/Cellar/ctags/5.8/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
"map <silent> <leader>l :TlistToggle<CR>

"pep8
let g:syntastic_python_checkers = ['pyflakes', 'pep8']


"vim-ref
"Ref webdictでalcを使う設定
let g:ref_source_webdict_cmd = 'lynx -dump -nonumbers %s'
"let g:ref_source_webdict_use_cache = 1
let g:ref_source_webdict_sites = {
            \ 'alc' : {
            \   'url' : 'http://eow.alc.co.jp/%s/UTF-8/'
            \   }
            \ }
function! g:ref_source_webdict_sites.alc.filter(output)
      return join(split(a:output, "\n")[42 :], "\n")
endfunction

"slack
let g:slack_incoming_token = 'xoxp-2665969857-2666572175-3756101063-46e00c'




""""""""""""""""""""""""""
" Other Settings
""""""""""""""""""""""""""
syntax on
"set enc=euc
"set termencoding=euc
set enc=utf-8
set termencoding=utf-8
set fileencodings=utf-8,euc-jp
set number
set mouse=a

set expandtab
set ts=4
set shiftwidth=4
set hlsearch
"setlocal omnifunc=syntaxcomplete#Complete
setlocal formatoptions-=ro
set t_Co=256
colorscheme default
hi Pmenu ctermbg=4
hi PmenuSel ctermbg=1
hi PMenuSbar ctermbg=4
hi Search term=reverse ctermbg=13 guibg=Yellow
command! Cal Calendar -view=day -split=vertical -width 10 
command! Clock Calendar -view=clock -split=horizontal -width 10 
command! Vsh VimShellPop -toggle
" md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
set incsearch

""for works
let $PATH = "/home/logs/env_batch/". $PATH

""for private

let g:neocomplete_enable_at_startup = 1
