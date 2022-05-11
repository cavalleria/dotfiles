""""""""""""""""""""""""""""""
" => install vim-plug if need
""""""""""""""""""""""""""""""
" if empty(glob('~/.vim_runtime/autoload/plug.vim'))
"     silent !curl -fLo ~/.vim_runtime/autoload/plug.vim --create-dirs
"                 \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

""""""""""""""""""""""""""""""
" => plugin list
""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim_runtime/plugged')

" colorscheme
" Plug 'morhetz/gruvbox'
" Plug 'sainnhe/gruvbox-material'
Plug 'lifepillar/vim-gruvbox8'

" file explorer by nerdtree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" YouCompleteMe, for path completion and function/variable/class completions
" Note: this repo contains a bunch of submodules, time consuming when clone.
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clang-completer',  'on':[]}
augroup load_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('YouCompleteMe') | autocmd! load_ycm
augroup END

" mark current line or a region of code as comment
" Run :commentary to comment current line
" Use visual mode to select region, then use `gcc` to comment this region
Plug 'tpope/vim-commentary'

" Multiple selections
Plug 'terryma/vim-multiple-cursors'

" Provides a start screen
Plug 'mhinz/vim-startify'

" Tabline for vim that's light as air.
Plug 'vim-airline/vim-airline', {'on':[]}
augroup load_airline
    autocmd!
    autocmd InsertEnter * call plug#load('vim-airline') | autocmd! load_airline
augroup END
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


" count vim startup time
Plug 'tweekmonster/startuptime.vim'


" List ends here. Remember to call :PlugInstall
call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_linters = {'python': ['flake8']}
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
let g:airline_theme='solarized'
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
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_WildIgnore = {
            \ 'dir': ['.git','__pycache__'],
            \ 'file': ['~$*','*.o','*.so','*.py[co]']
            \}

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map tt :NERDTreeToggle<CR>
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd w | endif

let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=45
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline = 1



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
let g:ycm_goto_buffer_command='same-buffer'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_filetype_blacklist = {'tagbar' : 1, 'nerdtree' : 1}
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
