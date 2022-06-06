""""""""""""""""""""""""""""""
" => install vim-plug if need
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => plugin list
""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory
call plug#begin('~/.my_config/vim/plugged')

" Colorscheme
Plug '~/.my_config/vim/sources_forked/vim-gruvbox8'

" File type icons to Vim plugins
Plug 'ryanoasis/vim-devicons'

" Run :commentary to comment current line
" Use visual mode to select region, then use `gcc` to comment this region
Plug 'tpope/vim-commentary'

" Multiple selections
Plug 'terryma/vim-multiple-cursors'

" Tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ale
Plug 'dense-analysis/ale'
" Plug 'dense-analysis/ale', {'on':[]}
" augroup load_ale
"     autocmd!
"     autocmd InsertEnter * call plug#load('ale') | autocmd! load_ale
" augroup END

" fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly.
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension', 'on':[] }
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension'}
" augroup load_leaderf
"     autocmd!
"     autocmd InsertEnter * call plug#load('LeaderF') | autocmd! load_leaderf
" augroup END

" Count vim startup time
Plug 'tweekmonster/startuptime.vim'

" Show a diff using Vim its sign column
Plug 'mhinz/vim-signify'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Terminal
Plug 'voldikss/vim-floaterm'

" snippets
Plug 'honza/vim-snippets'

" List ends here. Remember to call :PlugInstall
call plug#end()
colorscheme gruvbox8



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_config_home = '~/.my_config/home'
let g:coc_global_extensions = [
            \   'coc-marketplace',
            \   'coc-git',
            \   'coc-clangd',
            \   'coc-cmake',
            \   'coc-pyright',
            \   'coc-yaml',
            \   'coc-json',
            \   'coc-explorer',
            \   'coc-tabnine',
            \   'coc-snippets'
            \]
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
noremap <C-P> :CocList commands<CR>
nmap tt :CocCommand explorer<CR>

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"if vim started with folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |
            \   exe 'CocCommand explorer' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" GoTo code navigation.
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jy <Plug>(coc-type-definition)
nmap <leader>ji <Plug>(coc-implementation)
nmap <leader>jr <Plug>(coc-references)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enable = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%][%code%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_c_gcc_options              = '-Wall -Werror -O2 -std=c11'
let g:ale_c_clang_options            = '-Wall -Werror -O2 -std=c11'
let g:ale_cpp_gcc_options            = '-Wall -Werror -O2 -std=c++14'
let g:ale_cpp_clang_options          = '-Wall -Werror -O2 -std=c++14'
let g:ale_linters = {
            \   'python': ['flake8'],
            \   'c': ['cc', 'clangd'],
            \   'cpp': ['cc', 'clangd']
            \}
let g:ale_linters_explicit = 1
let g:ale_python_flake8_options = '
            \   --max-line-length=88
            \   --max-complexity=18
            \   --ignore=E402,W503,W504,W292
            \   --per-file-ignores=__init__.py:F401,F403,E402'
let g:ale_c_clangformat_style_option = '{BasedOnStyle: LLVM, IndentWidth: 4}'
let g:ale_c_clangformat_use_local_file = 1
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \  'python': ['isort','black'],
            \  'c': ['clang-format'],
            \  'cpp': ['clang-format']
            \}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-airline plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_theme='solarized'
" let g:airline_theme='gruvbox8'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {
            \ 'File': 1,
            \ 'Buffer': 1,
            \ 'Mru': 1,
            \ 'BufTag': 1,
            \ 'Function': 1,
            \ 'Line': 1,
            \ 'Rg': 1,
            \ 'Gtags': 1
            \}
let g:Lf_WildIgnore = {
            \ 'dir': ['.git','__pycache__'],
            \ 'file': ['~$*','*.o','*.so','*.py[co]']
            \}
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

let g:Lf_RgConfig = [
            \ "--max-columns=200",
            \ "--glob=!git/*",
            \ "--hidden"
            \]
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_vcs_list = ['git']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
map <Leader><Leader>w <Plug>(easymotion-w)
map <Leader><Leader>b <Plug>(easymotion-b)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>f <Plug>(easymotion-f)
map <Leader><Leader>s <Plug>(easymotion-s)
map <Leader><leader>. <Plug>(easymotion-repeat)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
