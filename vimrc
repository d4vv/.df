set shell=zsh
set mouse=a
set laststatus=2
set cursorline
set lazyredraw
set fillchars="fold: "
set nostartofline

syntax enable
filetype plugin on
set background=dark
let base16colorspace=256
set termguicolors
colorscheme base16-tomorrow-night

set wildmenu  " Turn on command line completion wild style
set wildmode=list:longest  " Turn on wild mode huge list
set wildignore=*.pyc,*.jpg,*.gif,*.png,*.mo,*.egg-info/,__pycache__/

" set foldmethod=syntax
set foldlevel=99

set whichwrap=[,]

set noerrorbells  " Don't make noise when something errors

set guifont=Monaco\ Regular:h16
set colorcolumn=90
set number
set relativenumber
set scrolloff=8
set showcmd
set sidescrolloff=3
set timeoutlen=250

set completeopt=longest,menu

let mapleader=";"
map <leader>s :source ~/.vimrc<CR>

set hidden
set history=100

" JSON
let g:vim_json_syntax_conceal = 0

" Insert a single character and stay in normal mode
nnoremap <Leader><Space> :exec "normal i".nr2char(getchar())."\e"<CR>

" Write/quit shortcuts
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :qa<CR>
nnoremap <Leader>x :x<CR>

" Splits
nnoremap <Leader>v :vsp<Space><CR>
nnoremap <Leader>h :sp<Space><CR>

" Go to next error
nnoremap <Leader>e :ALENextWrap<CR>

vnoremap <Leader>s :sort<CR>
nnoremap <Leader>n :nohl<CR>

" Python stuff
nnoremap <Leader>db oimport ipdb; ipdb.set_trace()<Esc>
nnoremap <Leader>a a*args, **kwargs<Esc>

" Manage buffers
nnoremap <C-w> :Bclose<CR>
noremap <C-p> :bp<CR>
noremap <C-n> :bn<CR>

" Jump easily between open windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Nicer navigation in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"Indentation
filetype indent on
set nowrap
set expandtab  " Convert tabs to spaces
set tabstop=2  " Width of displayed tabs
set softtabstop=1  " Number of spaces in tab / backspace
set shiftwidth=2  " Auto-indent amount when using cindent, >>, etc
set shiftround  " When at 3 spaces, and I hit > ... go to 4, not 5
set autoindent

"Indentation
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap < <gv
vnoremap > >gv

"Keep selection after indent/unindent
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"Wrap text
nnoremap Q gqq
vnoremap Q gq

"Toggle fold
nnoremap <space> za

set ignorecase  " Case insensitive by default
set smartcase  " If there are caps, go case-sensitive

set formatoptions=rqj

"Remove white spaces after save
autocmd BufWritePre * :%s/\s\+$//e

"Highlight search items + esc searching
set hlsearch
set incsearch
nnoremap <esc><esc> :noh<return>

"Re-Open Previously Opened File
nnoremap <Leader><Leader> :e#<CR>

"Show Matching Parenthesis
set showmatch

"NERD Tree
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

"Airlines
set noshowmode  " Don't show editor mode, since it's in airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#whitespace#symbol = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '│'
let g:airline_right_alt_sep = '│'
let g:airline#extensions#tabline#left_sep = '▌'
let g:airline#extensions#tabline#right_sep = '▐'
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline_skip_empty_sections = 1
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline#extensions#default#layout = [
    \ [ 'a', 'error', 'warning', 'c' ],
    \ [ 'x', 'z', ]
    \ ]
let g:airline_extensions = [
    \ 'po', 'ale', 'tabline', 'whitespace'
    \ ]
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


"Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

"Bclose
let bclose_multiple = 0

"Signify
let g:signify_sign_change = '~'

"IndentLines
let g:indentLine_char = '¦'

set list  " We do what to show tabs, to ensure we get them out of my files
set listchars=tab:>·,trail:·  " Show tabs and trailing

"IndentLinesGuide
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" vim-javascript
let g:javascript_enable_domhtmlcss = 1

" vim-jsx
let g:jsx_ext_required = 1

"Neocomplete
let g:neocomplete#enable_at_startup = 1
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

"Grep
set grepprg=git\ grep
let g:grep_cmd_opts = '--line-number'

"Surround
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #
let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " =

" Disable the macvim toolbar
set guioptions-=T

"delimitMate
" let delimitMate_expand_cr = 1
" let delimitMate_expand_space = 1

"Clipboard
" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cr :let @* = expand("%")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

set clipboard=unnamed

nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>

"Ale
let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'jsx': ['prettier', 'eslint'],
    \ 'vue': ['prettier', 'eslint'],
    \ 'reactjs': ['prettier', 'eslint'],
    \ }
let g:ale_fix_on_save = 1
let g:ale_open_list = 0
let g:ale_lint_delay = 500
let g:ale_emit_conflict_warnings = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_errorle_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_on_text_changed = 'never'
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

"FZF
set rtp+=~/.fzf
nnoremap <Leader>t :Files<CR>
function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd ColorScheme * call <sid>update_fzf_colors()
augroup END

"Multicursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-d>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-d>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"Autoformat
noremap <F3> :Autoformat<CR>

"Beautify
map <c-f> :Beautify<cr>

call plug#begin('~/.vim/plugged')

" FZF
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" NERD Commenter
Plug 'scrooloose/nerdcommenter'

"NERD Tree
Plug 'scrooloose/nerdtree'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Supertab
Plug 'ervandew/supertab'

" Fugitive git wrapper
Plug 'tpope/vim-fugitive'

" Signify git diffs
Plug 'mhinz/vim-signify'

" Multicursor
Plug 'terryma/vim-multiple-cursors'

" IndentLines
Plug 'Yggdroot/indentLine'

" IndentLinesGuide
Plug 'nathanaelkane/vim-indent-guides'

" DelimitMate
Plug 'Raimondi/delimitMate'

" Vim-JSX
Plug 'mxw/vim-jsx'

" Vim-Javascript
Plug 'pangloss/vim-javascript'

" Styled-components
Plug 'styled-components/vim-styled-components'

"Neocomplete
Plug 'Shougo/neocomplete.vim'

"Emmet
Plug 'mattn/emmet-vim'

"GraphQL
Plug 'jparise/vim-graphql'

"Stylus syntax
Plug 'wavded/vim-stylus'

"SASS Syntax
Plug 'cakebaker/scss-syntax.vim'

"HTML5
Plug 'othree/html5.vim'

"MatchTag
Plug 'gregsexton/MatchTag'

"Greplace - find and replace in many files
Plug 'skwp/greplace.vim'

"SplitJoin - switching between one line and multiline (block of code)
Plug 'AndrewRadev/splitjoin.vim'

"Surrounds
Plug 'tpope/vim-surround'

"tComment
Plug 'tomtom/tcomment_vim'

"Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

"Vim repeat
Plug 'tpope/vim-repeat'

"Ale
Plug 'w0rp/ale'

"Sleuth
Plug 'tpope/vim-sleuth'

"CSS3 Syntax
Plug 'hail2u/vim-css3-syntax'

"Fastfold
Plug 'Konfekt/FastFold'

"Ack
Plug 'mileszs/ack.vim'

"Vim Markdown
Plug 'gabrielelana/vim-markdown'

"Vim Twig Syntax
Plug 'nelsyeung/twig.vim'

"Vim Beautify
Plug 'zeekay/vim-beautify'

"Vuejs Syntax
Plug 'posva/vim-vue'

"Vim Eunuch (rename etc)
Plug 'tpope/vim-eunuch'

"Base16 Vim
Plug 'chriskempson/base16-vim'

"Better JSON for VIM
Plug 'elzr/vim-json'

"Vim Eunuch (Rename, mkdir etc.)
Plug 'tpope/vim-eunuch'

"Autoformat
Plug 'Chiel92/vim-autoformat'

" Initialize plugin system
call plug#end()
