" Adapted from https://github.com/zchrissirhcz/dotfiles/blob/master/dotvim/vimrcs/vim-plug_plugins_config.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
"let s:vim_runtime = expand('<sfile>:p:h')."/.."
"call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
"call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
"call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
"call pathogen#helptags()

""""""""""""""""""""""""""""""
" => install vim-plug if need
""""""""""""""""""""""""""""""
if empty(glob('~/.vim_runtime/autoload/plug.vim'))
    silent !curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""
" => plugin list
""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim_runtime/plugged')

" Declare the list of plugins
" - local folder: sources forked
Plug '~/.vim_runtime/sources_forked/set_tabline'
Plug '~/.vim_runtime/sources_forked/vim-irblack-forked'
Plug '~/.vim_runtime/sources_forked/vim-peepopen'

" - github repos

" a universal set of defaults that (hopefully) everyone can agree on.
Plug 'tpope/vim-sensible'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" file explorer by nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git wrapper, use :Git add :Git commit :Git diff  in vim
Plug 'tpope/vim-fugitive'

" A git-lens like plugin
Plug 'zivyangll/git-blame.vim'

" vim-signify serves as an alternative to vim-gitgutter
" Run :SignifyDiff for comparison in two columns
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" ale
""Plug 'w0rp/ale'  the original repo contains a large image. don't use it
Plug 'https://gitee.com/aczz/ale', {'branch': 'fallback'}

" lightline and lightline support for ale
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Parentheses related
Plug 'jiangmiao/auto-pairs'

" Rainbow Parentheses Improved, slightly highlight for parenthese
Plug 'luochen1990/rainbow'

"A collection of language packs for Vim.
Plug 'https://gitee.com/mirrors/Polyglot'

" run :Goyo to into Distraction-free writing mode
Plug 'junegunn/goyo.vim'

" YouCompleteMe, for path completion and function/variable/class completions
" Note: this repo contains a bunch of submodules, time consuming when clone.
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clang-completer'  }

" color schemes
Plug '~/.vim_runtime/sources_forked/peaksea'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

" c++ related
Plug 'rhysd/vim-clang-format'
Plug 'octol/vim-cpp-enhanced-highlight'

"Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" Run :CtrlP for simple usage
Plug 'ctrlpvim/ctrlp.vim'

" mark current line or a region of code as comment
" Run :commentary to comment current line
" Use visual mode to select region, then use `gcc` to comment this region
Plug 'tpope/vim-commentary'

" First in visual mode select code region (multiple lines)
" Then run :Tab /= 
" It will generate aliged code
" for example:
"   one = 1
"   two = 2
"   three = 3
"   four = 4
" becomes
"   one   = 1
"   two   = 2
"   three = 3
"   four  = 4
Plug 'godlygeek/tabular'

" Brings physics-based smooth scrolling to the Vim world!
Plug 'yuttie/comfortable-motion.vim'

" Vim plugin for the Perl module / CLI script 'ack'
Plug 'mileszs/ack.vim'

" Quickly and easily switch between buffers
Plug 'corntrace/bufexplorer'

" The Most Recently Used (MRU) plugin
Plug 'vim-scripts/mru.vim'

" Open file under cursor when pressing gf
Plug 'amix/open_file_under_cursor.vim'

" Defines a new text object representing lines of code at the same indent level
Plug 'michaeljsmith/vim-indent-object'

" Multiple selections
Plug 'terryma/vim-multiple-cursors'


" List ends here. Remember to call :PlugInstall
call plug#end()



""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按 tt 键后， 跳出/隐藏 目录
map tt :NERDTreeToggle<CR>

" 在 NERDTree 里打开文件，在新的 tab 里显示，而不是覆盖原来的标签页
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
"let NERDTreeQuitOnOpen=0

" 从 NERDTree 打开文件后， 不要关掉 NERDTREE 窗口 （但光标是在新开标签页的文件里）
autocmd BufWinEnter * NERDTreeMirror 

" 从 NERDTree 打开文件后， 把光标立即从标签页切换回到 NERDTree 界面
"autocmd! VimEnter * NERDTree | wincmd w

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd w | endif

let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree-git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

autocmd! User goyo.vim echom 'Goyo is now loaded!'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
    \ },
    \ 'separator': { 'left': ' ', 'right': ' ' },
    \ 'subseparator': { 'left': ' ', 'right': ' ' }
    \ }

let g:ale_linters = {
\   'c': ['cppcheck', 'clang-format', 'clangd'],
\   'cpp': ['cppcheck', 'clang-format', 'clangd'],
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline-ale config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" register the component
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

" set color to the component
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

" add the component to the lightline  (right side)
let g:lightline.active = {
    \   'left': [ ['mode', 'paste'],
    \             ['readonly', 'filename', 'modified', 'charvaluehex'] ],
    \   'right': [ ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
    \              [ 'lineinfo' ], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ]
    \}


let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_c_parse_compile_commands = 1

" from daquexian/dot_files
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=White


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe (YCM)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_min_num_identifier_candidate_chars=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" [ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_goto_buffer_command='vertical-split'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_rust_src_path = '/usr/local/rustc-1.6.0/src'
let g:ycm_filetype_blacklist = {'tagbar' : 1, 'nerdtree' : 1}
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

" rainbow mess up cmake syntax. turn it off
" https://github.com/luochen1990/rainbow/issues/77
let g:rainbow_conf = {
\   'separately': {
\       'cmake': 0,
\   }
\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AutoPairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsMultilineClose=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => git-blame
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
