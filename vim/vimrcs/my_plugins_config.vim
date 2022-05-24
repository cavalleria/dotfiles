""""""""""""""""""""""""""""""
" => install vim-plug if need
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => plugin list
""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim_runtime/plugged')

" Colorscheme
Plug 'lifepillar/vim-gruvbox8'

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
Plug 'dense-analysis/ale', {'on':[]}
augroup load_ale
    autocmd!
    autocmd InsertEnter * call plug#load('ale') | autocmd! load_ale
augroup END

" fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly.
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension', 'on':[] }
augroup load_leaderf
    autocmd!
    autocmd InsertEnter * call plug#load('LeaderF') | autocmd! load_leaderf
augroup END

" Count vim startup time
Plug 'tweekmonster/startuptime.vim'

" Show a diff using Vim its sign column
" Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
Plug 'mhinz/vim-signify', { 'branch': 'legacy' }

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}





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
            \   'coc-tabnine'
            \]
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
noremap <C-P> :CocList commands<CR>
nmap tt :CocCommand explorer<CR>

noremap <silent><expr> <TAB>
      \  umvisible() ? "\<C-n>" :
      \ CheckBack pace() ? "\<TAB>" :
      \ coc#refresh()
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" GoTo code navigation.
nmap <leader> jd <Plug>(coc-definition)
nmap <leader> jy <Plug>(coc-type-definition)
nmap <leader> ji <Plug>(coc-implementation)
nmap <leader> jr <Plug>(coc-references)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_linters = {'python': ['flake8']}
let g:ale_linters_explicit = 1
let g:ale_python_flake8_options = '--max-line-length=88 --max-complexity=18 --ignore=E402,W503,W504,W292'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enable = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%][%code%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \  'python': [
                \    'isort',
                \    'yapf',
                \   ]
                \}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-airline plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_theme='solarized'
let g:airline_theme='gruvbox8'
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
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
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
