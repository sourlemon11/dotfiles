"" g:varname	The variable is global
"" s:varname	The variable is local to the current script file
"" w:varname	The variable is local to the current editor window
"" t:varname	The variable is local to the current editor tab
"" b:varname	The variable is local to the current editor buffer
"" l:varname	The variable is local to the current function
"" a:varname	The variable is a parameter of the current function
"" v:varname	The variable is one that Vim predefines 
"" &varname	A Vim option (local option if defined, otherwise global)
"" &l:varname	A local Vim option
"" &g:varname	A global Vim option
"" @varname	A Vim register
"" $varname	An environment variable 
" disable plugins?
" TIPS
" :verbose to find what is mapped to what

""" Pathogen
"let default_disabled = ['YouCompleteMe', 'vim-indent-guides', 'dein.vim', 'rainbow_parentheses', 'ultisnips']
"if has('nvim')
"  let g:pathogen_disabled = default_disabled + ['neocomplete.vim', 'indentLine']
"elseif has('gui_running')
"  let g:pathogen_disabled = default_disabled + ['deoplete.vim']
"else
"  let g:pathogen_disabled = default_disabled + ['deoplete.vim']
"endif
"execute pathogen#infect()

" Plug function to check running vim version 
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Map key to toggle opt
"function MapToggle(key, opt)
"  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
"  exec 'nnoremap '.a:key.' '.cmd
"  exec 'inoremap '.a:key." \<C-O>".cmd
"endfunction
"command! -nargs=+ MapToggle call MapToggle(<f-args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" SETTINGS """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
filetype plugin indent on 
""set number
let mapleader = "\<space>"
""let vim_paths = system('echo $PATH')
set path+=~/.local/include/npm-global/bin
set tabstop=2
set softtabstop=2
set smarttab
set shiftwidth=2
"" set colors
set hidden                                                          " can switch buffer with unsaved changes
set undofile                                                        " save changes after exit
set undodir=~/.vim/undodir                                          " file for changes
set undolevels=1000
set nocompatible
set autoindent
set smartindent
set magic   "" REGEX
set wildmenu ""menu completion
set wildmode=list:longest,full
set wildignore=*.swp,*.bak,*.pyc,*.class
set title "" change the terminal title
set history=500
set autoread "" Update when changed on the outside
" Actually auto-update
augroup autoread
	autocmd!
	au FocusLost,WinLeave * :silent! wa
	au FocusGained,BufEnter * :silent! !
augroup END
set cmdheight=1
set ignorecase "" when searching
set incsearch "" search like modern browserssearch like modern browserssearch like modern browserssearch like modern browserssearch like modern browserssearch like modern browsers
set hlsearch "" highlighting
map <leader><leader> :nohlsearch<CR>
set wrap
set breakindent "" smart wraps on next line
"set wrapmargin=2 "" Hard Wrap
set scrolloff=5 "" min # of lines before/after cursor
"" Store swap files in fixed location, not current directory.
set dir=~/.vim/backup//,/var/tmp//,/tmp//,.
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
if !has("nvim")
  set viminfo='150,\"100,:200,~/.vim/viminfo/.viminfo
endif
set shell=/bin/bash
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,*.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
"set cursorline
set timeoutlen=1000
"set lazyredraw
set clipboard=unnamedplus
set complete -=i
set wrapscan
set splitbelow
set splitright
set synmaxcol=200
set numberwidth=1
set cursorline
" y = repeat yank action with .
set cpoptions+=y

"" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"" No annoying sounds visuals
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"" Toggle line numbers
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

nnoremap <leader>n :call NumberToggle()<cr>

"" Code Settings
augroup code
  autocmd!
  let codelist = ['*.c','*.cpp','*.py','*.js','*.json']
  autocmd BufNewFile,BufRead *.cls,*.tex,*.sty set syntax=tex
  au BufNewFile,BufRead *.pentadactylrc set syntax=vim
  autocmd BufWinEnter *.py,*.pyw,*.c,*.h match XtraWhitespace /\s\+$/
  autocmd InsertEnter *.py,*.pyw,*.c,*.h match XtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave *.py,*.pyw,*.c,*.h match XtraWhitespace /\s\+$/
  autocmd BufWinLeave *.py,*.pyw,*.c,*.h call clearmatches()
  au BufNewFile,BufRead *.py
        \ set tabstop=4
        \ set softtabstop=4
        \ set shiftwidth=4
        \ set textwidth=79
        \ set expandtab
        \ set autoindent
        \ set fileformat=unix
  "" au BufRead,BufNewFile *.js set smartindent
  "" Colorized Brackets
  "" C Programming Configurations
  autocmd FileType c map <F5> expand('%:r')
  " Go to the last cursor location when a file is opened, unless this is a
  " git commit (in which case it's annoying)
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
        \ endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" PLUGINS """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif
set runtimepath+='~/.vim/autoload/dein.vim','~/.local/bin'
let $PATH .= ':~/.local/bin'

call plug#begin('~/.vim/bundle/')
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'SirVer/ultisnips'
  "Plug 'metakirby5/codi.vim'
  "Plug 'rking/ag.vim'
  "Plug 'godlygeek/csapprox' ,Cond(has('vim'))
  "Plug 'sjl/gundo.vim'
  Plug 'tomtom/tlib_vim'
  "Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tpope/vim-repeat'
  Plug 'kshenoy/vim-signature'
  let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "m,",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "m-",
    \ 'DeleteMark'         :  "dm",
    \ 'PurgeMarks'         :  "m<Space>",
    \ 'PurgeMarkers'       :  "m<BS>",
    \ 'GotoNextLineAlpha'  :  "']",
    \ 'GotoPrevLineAlpha'  :  "'[",
    \ 'GotoNextSpotAlpha'  :  "`]",
    \ 'GotoPrevSpotAlpha'  :  "`[",
    \ 'GotoNextLineByPos'  :  "]'",
    \ 'GotoPrevLineByPos'  :  "['",
    \ 'GotoNextSpotByPos'  :  "]`",
    \ 'GotoPrevSpotByPos'  :  "[`",
    \ 'GotoNextMarker'     :  "]-",
    \ 'GotoPrevMarker'     :  "[-",
    \ 'GotoNextMarkerAny'  :  "]=",
    \ 'GotoPrevMarkerAny'  :  "[=",
    \ 'ListBufferMarks'    :  "m/",
    \ 'ListBufferMarkers'  :  "m?"
    \ }
  augroup signature
    au Filetype qf map <buffer> q :q<cr>
  augroup END
  Plug 'tpope/vim-surround'
  Plug 'roman/golden-ratio'
	augroup golden_ratio
		autocmd!
		"autocmd BufEnter,BufLeave fugitive*,NERD* normal ':GoldenRatioToggle<cr>'
	augroup END
  let g:golden_ratio_exclude_nonmodifiable = 0
  let g:golden_ratio_wrap_ignored = 1
  """ Plugin Themes """
  Plug 'flazz/vim-colorschemes'
  Plug 'ciaranm/inkpot'
  Plug 'vim-scripts/peaksea'
  Plug 'morhetz/gruvbox'
  Plug 'goatslacker/mango.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'zeis/vim-kolor'
  Plug 'powerman/vim-plugin-AnsiEsc', Cond(has('vim'), { 'for': 'taskedit' })
  """ END """
  """ Plugin Filetypes """
  "Plug 'avakhov/vim-yaml'
  Plug 'ap/vim-css-color'
  Plug 'dag/vim-fish'
  Plug 'pangloss/vim-javascript'
  "Plug 'sudar/vim-arduino-syntax'
  "Plug 'freitass/todo.txt-vim'
  Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
  Plug 'Shutnik/jshint2.vim', { 'for': 'javascript' }
  set runtimepath+=~/.local/include/npm-global/bin/
  let jshint2_save = 1
  let jshint2_close = 0
  " jshint validation
  augroup jshint
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>lj :JSHint<CR>
    autocmd FileType javascript inoremap <buffer> <localleader>lj <C-O>:JSHint<CR>
    autocmd FileType javascript vnoremap <buffer> <localleader>lj :JSHint<CR>
    au FileType javascript nnoremap <buffer> <localleader>gn :lnext<CR>
    au FileType javascript inoremap <buffer> <localleader>gn <C-O>:lnext<CR>
    au FileType javascript vnoremap <buffer> <localleader>gn :lnext<CR>
    au FileType javascript nnoremap <buffer> <localleader>gp :lprevious<CR>
    au FileType javascript inoremap <buffer> <localleader>gp <C-O>:lprevious<CR>
    au FileType javascript vnoremap <buffer> <localleader>gp :lprevious<CR>
  augroup END
  "" END """

  "Plug 'tbabej/taskwiki', {'for': 'vimwiki'}
  "nmap <leader>tt :vsplit ~/vimwiki/Tasks.wiki<cr><C-w>L

  Plug 'tpope/vim-fugitive'
  "" FUGITIVE
  nmap <leader>gs :Gstatus<cr>
  nmap <leader>ga :Git add %:p:h<cr>
  nmap <leader>gau :Git add -u<cr>
  nmap <leader>gc :Git commit -m '
  nmap <leader>gca :Git commit -a -m '
  nmap <leader>gg :Ggrep<cr>
  nmap <leader>gl :Glog<cr>
  nmap <leader>gd :Gsdiff<cr>
  nmap <leader>gw :Gwrite 
  set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

  Plug 'airblade/vim-gitgutter'
  "" Git Gutter
  " uses hunks
  " commit hunk <leader>h<s,u> hunk stage, undo
  set updatetime=1000
  let g:gitgutter_sign_modified = '!'
  let g:gitgutter_sign_removed = '-'

  "Plug 'kien/rainbow_parentheses.vim'
  Plug 'luochen1990/rainbow'
  "" COLOR
  let g:rainbow_active = 1
  let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'lightgoldenrod2', 'lightpink1', 'olivedrab1'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \            'guifgs': ['royalblue3', 'lightgoldenrod2', 'lightpink1', 'olivedrab1'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \       'vimwiki': ['start=/(/ end=/)/', 'start=/{/ end=/}/ fold'],
    \   }
    \}

  Plug 'godlygeek/tabular'
  nnoremap <localleader>y :Tabularize yaml<cr>
  augroup yaml
    autocmd!
    " Doesn't work
    autocmd FileType yaml nnoremap <buffer> <localleader>y :Tabularize yaml<cr>
  augroup END
  highlight XtraWhitespace ctermbg=red guibg=red


  Plug 'Raimondi/delimitMate'
  "" DelimitMate
  let delimitMate_expand_cr=1 
  let delimitMate_expand_space = 1
  let delimitMate_jump_expansion = 1
  imap <C-g> <Plug>delimitMateJumpMany
  augroup delims
    au Filetype vimwiki let b:delimitMate_expand_space = 0
  augroup END

  Plug 'christoomey/vim-tmux-navigator'
  "" Tmux navigator
  let g:tmux_navigator_no_mappings = 1
  let g:tmux_navigator_save_on_switch = 1
  nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

  Plug 'terryma/vim-multiple-cursors'
  "" Multiple Cursors
  " compatibility with neocomplete
  " Called once right before you start selecting multiple cursors
  function! Multiple_cursors_before()
    if exists(':NeoCompleteLock')==2
      exe 'NeoCompleteLock'
    endif
  endfunction

  let g:multi_cursor_quit_key = '<C-c>'

  " Called once only when the multiple selection is canceled (default
  " <Esc>)
  function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock')==2
      exe 'NeoCompleteUnlock'
    endif
  endfunction

  Plug 'nathanaelkane/vim-indent-guides'
  "" INDENT GUIDES

  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_space_guides          = 1
  let g:indent_guides_tab_guides            = 1
  let g:indent_guides_start_level           = 2
  let g:indent_guides_guide_size            = 2
  let g:indent_guides_color_change_percent  = 15
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify', 
        \'calendar', 'vimwiki', '']

  Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes' 
  "" Airline
  " Display all buffers when one tab open
  if &g:t_Co==16 || &g:term=="xterm"
    let g:airline_theme='base16_default'
  elseif &g:t_Co==256 && &g:term=='xterm-256color'
    let g:airline_theme='gruvbox'
  elseif &g:term=="builtin_gui"
  let g:airline_theme='gruvbox'
  endif
  let g:airline#extensions#tabline#enabled = 1

  function! AirlineInit()
    let g:airline_section_y = airline#section#create(['ffenc', '%{strftime("%H:%M")}'])
  endfunction
  autocmd VimEnter * call AirlineInit()

  let g:airline_section_c = ''
  let g:airline_powerline_fonts=1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#branch#empty_message = ''
  let g:airline#extensions#branch#displayed_head_limit = 10
	" Syntastic Airline
  let g:airline#extensions#syntastic#enabled = 1
	" Gitgutter Airline
  let g:airline#extensions#hunks#enabled = 1
  let g:airline#extensions#hunks#non_zero_only = 0
	" CtrlP Airline
	let g:airline#extensions#ctrlp#show_adjacent_modes = 1

  Plug 'Shougo/neocomplete.vim', Cond(!has('nvim')) | Plug 'Shougo/vimproc.vim',{ 'do': 'make' }
  "" Neocomplete
	let g:neocomplete#use_vimproc=1
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#disable_auto_complete = 0
  " skip if larger than time. default = 0.3
  let g:neocomplete#skip_auto_completion_time = "0.3"
  " Manual
  "let g:neocomplete#manual_completion_start_length = 5
  let g:neocomplete#auto_complete_delay = 100
  let g:neocomplete#max_list = 20
  let g:neocomplete#min_keyword_length = 5
  let g:neocomplete#auto_completion_start_length = 4
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  " default 500000
  let g:neocomplete#sources#tags#cache_limit_size = 300000
  " Mappings
  "inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
 
  " Enable omni completion.
  augroup omni
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  augroup END

  Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'
  "" Neosnippets
  "let g:neosnippet#snippets_directory = '~/.vim/snippets'
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  let g:neosnippet#snippets_directory = '~/.vim/snippets'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : '~/.vimshell_hist',
        \ }

  Plug 'SirVer/ultisnips'
  "" Ultrisnips
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  Plug 'scrooloose/syntastic'
  "" Syntastic
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_loc_list_height = 3
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 1
  let g:syntastic_enable_highlighting = 1
  " let g:syntastic_ignore_files = ''
  let g:syntastic_error_symbol = "†"
  let g:syntastic_warning_symbol = "§"
  let g:syntastic_enable_balloons = 1
  "let g:syntastic_filetype_map = {
  "    \ "plaintex": "tex",
  "    \ "gentoo-metadata": "xml" }
  map <F9> :SyntasticToggleMode<CR>
  "" let g:syntastic_mode_map = {" mode " : " passive " } " for changing modes activly
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  " Filetypes
  let g:syntastic_javascript_checkers = ['jshint']
  augroup syntastic
    au BufReadPre,BufNewFile ~/Documents/docs/json-resume/themes/myawesome/src/latex/resume.tex let g:syntastic_check_on_wq=0
    au BufReadPre,BufNewFile ~/Documents/docs/json-resume/themes/myawesome/src/latex/resume/* let g:syntastic_check_on_wq=0
    au BufReadPre,BufNewFile ~/Documents/docs/json-resume/themes/myawesome/src/latex/* let g:syntastic_check_on_open=0
  augroup END

  "Plug 'https://github.com/itchyny/calendar.vim'
  """ CALENDAR
  "let g:calendar_google_calendar = 1
  "let g:calendar_google_task = 0

  Plug 'lervag/vimtex'
  "" VIMTEX
  let g:vimtex_latexmk_continuous=0
  ""let g:vimtex_quickfix_autojump=0
  let g:vimtex_latexmk_background=1
  let g:vimtex_latexmk_options='-xelatex'
  let g:LatexBox_show_warnings=1
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.tex =
        \ '\v\\%('
        \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
        \ . '|hyperref\s*\[[^]]*'
        \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|%(include%(only)?|input)\s*\{[^}]*'
        \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . ')'
  if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
  endif
  let g:ycm_semantic_triggers.tex = [
        \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
        \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
        \ 're!\\hyperref\[[^]]*',
        \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
        \ 're!\\(include(only)?|input){[^}]*',
        \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
        \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
        \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
        \ ]
  let g:vimtex_latexmk_callback_hooks = ['MyTestHook']

  function! MyTestHook(status)
    echom a:status
  endfunction

  Plug 'ctrlpvim/ctrlp.vim' | Plug 'FelikZ/ctrlp-py-matcher'
  "" CTRLP
  nnoremap <C-s> :CtrlPBuffer<CR>
  let g:ctrlp_extensions = ['dir', 'undo']
  " [c,a,r,w,0]==[current,current unless subdir of cwd, nearest parent to .git,
  " like r but start from pwd instead current]
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_regexp = 1
  let g:ctrlp_show_hidden = 0
  let g:ctrlp_custom_ignore = { 
        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        \ 'file': '\v\.(exe|so|dll|o|bin)$',
        \ }
  let g:ctrlp_prompt_mappings = {
        \ 'PrtBS()':              ['<bs>', '<c-]>'],
        \ 'PrtDelete()':          ['<c-d>'],
        \ 'PrtDeleteWord()':      ['<c-w>'],
        \ 'PrtDeleteEnt()':       ['<del>'],
        \ 'PrtClear()':           ['<c-u>'],
        \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
        \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
        \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
        \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
        \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
        \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
        \ 'PrtHistory(-1)':       ['<c-h>'],
        \ 'PrtHistory(1)':        ['<c-l>'],
        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
        \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
        \ 'ToggleFocus()':        ['<s-tab>'],
        \ 'ToggleRegex()':        ['<c-r>'],
        \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
        \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
        \ 'PrtExpandDir()':       ['<tab>'],
        \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
        \ 'PrtInsert()':          ['<c-\>'],
        \ 'PrtCurStart()':        ['<c-a>'],
        \ 'PrtCurEnd()':          ['<c-e>'],
        \ 'PrtCurLeft()':         ['<left>', '<c-^>'],
        \ 'PrtCurRight()':        ['<right>'],
        \ 'PrtClearCache()':      ['<F5>'],
        \ 'CreateNewFile()':      ['<c-y>'],
        \ 'MarkToOpen()':         ['<c-m>'],
        \ 'OpenMulti()':          ['<c-o>'],
        \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
        \ }

  " PyMatcher for CtrlP
  " if !has('python')
  "     echo 'In order to use pymatcher plugin, you need +python compiled vim'
  " else
  "     let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  " endif

  " Set delay to prevent extra search
  let g:ctrlp_lazy_update = 350

  " Do not clear filenames cache, to improve CtrlP startup
  " You can manualy clear it by <F5>
  let g:ctrlp_clear_cache_on_exit = 0

  " Set no file limit, we are building a big project
  let g:ctrlp_max_files = 0

  " If ag is available use it as filename list generator instead of 'find'
  " Will disable ctrlp_custom_ignore
  if executable("ag")
      set grepprg=ag\ --nogroup\ --nocolor
  ""    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.o'' --ignore ''.bin'' --ignore ''.git*'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
  endif

  Plug 'mhinz/vim-startify'
  "" STARTIFY
  let g:startify_list_order = ['sessions', 'bookmarks', 'files', 'dir', 'commands']
  let g:startify_session_sort = 1
  let g:startify_session_persistence = 0
  let g:startify_change_to_dir = 1
  let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'i': '~/.config/i3/config'}, {'t': '~/.tmux.conf'}, {'f': '~/.config/fish/config.fish'} ]

  "" Netrw options
  "let g:netrw_altv = 1
  "let g:netrw_banner = 0
  "let g:netrw_browse_split = 4
  "let g:netrw_liststyle = 3
  ""let g:netrw_winsize = -28
  "let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'  " --> I want line numbers on the netrw buffer
  "nnoremap <leader>cd :Lexplore %:p:h<CR>:pwd<CR>
  "nnoremap <silent> <f2> :Lexplore<cr>

  Plug 'scrooloose/nerdtree'
  "" NERDTREE
  map <F2> :NERDTreeToggle<CR>
  let g:NERDTreeChDirMode=2
  let NERDTreeIgnore=[
        \ '\.aux$', 
        \ '\.fls', 
        \ '\.log', 
        \ '\.out',
        \ '\.fdb_latexmk']
  "" Directory Moving/Changing
  nnoremap <leader>cd :cd %:p:h<CR>:NERDTreeCWD<CR>:pwd<CR>

  "" Both nerdtree and STARTIFY at startup
  autocmd VimEnter *
        \   if !argc()
        \ |   Startify
        \ |   NERDTree
        \ |   wincmd w
        \ | endif
  "" Startify on new buffer
  let g:blacklist = ['txt']
  "autocmd BufWinEnter * if index(blacklist, &ft) < 0
  "   \ | :Startify

  Plug 'rking/ag.vim'
  "" AG
  nnoremap <leader>/ :Ag 
  nmap <f3> :Ag <c-r>=expand("<cword>")<cr><cr>

  "Plug 'vimwiki/vimwiki'
  "" VIMWIKI
  "let g:vimwiki_syntax='markdown'
  "let g:vimwiki_ext='.md'

  "let g:vimwiki_list = [{
  "      \ 'auto_toc':1,
  "      \ 'hl_headers': 1,
  "      \ 'hl_cb_checked':1,
  "      \ 'template_path': 'templates',
  "      \ 'template_default': 'default',
  "      \ 'template_ext': '.html',
  "      \ 'css_name': 'style.css'}]
  "let g:vimwiki_listsyms = '✗○◐●✓'

  "hi VimwikiHeader1 ctermfg=1  guifg=#ff0000
  "hi VimwikiHeader2 ctermfg=2  guifg=#FF7F00
  "hi VimwikiHeader3 ctermfg=3  guifg=#FFFF00
  "hi VimwikiHeader4 ctermfg=4  guifg=#00FF00
  "hi VimwikiHeader5 ctermfg=5  guifg=#FAD09F
  "hi VimwikiHeader6 ctermfg=6  guifg=#FF8A9A
  "hi VimwikiHeader7 ctermfg=17 guifg=#9400D3

  "augroup vimwiki
  "  autocmd!
  "  " Doesn't work
  "  "autocmd FileType vimwiki imap <C-l>l <Plug>VimwikiIncreaseLvlSingleItem
  "  "autocmd FileType vimwiki imap <C-h>h <Plug>VimwikiDecreaseLvlSingleItem

	"	" remap local search 
	"	autocmd FileType vimwiki nmap <leader>/ :VWS 

  "  au FileType vimwiki unmap <leader>n
  "augroup END

  Plug 'reedes/vim-lexical'
  "" LEXICAL
  augroup lexical
    autocmd!
    autocmd FileType markdown,mkd,tex,textile,vimwiki call lexical#init()
    "" autocmd FileType text call lexical#init({ 'spell': 0 })
  augroup END
  let g:lexical#spell = 0 ""default spell check
  let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt']
  let g:lexical#thesaurus_key = 'zk'

" Add plugins to &runtimepath
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" CASE SETTINGS """"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let c_color_scheme = 'gruvbox'
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  "set lines=33 columns=123
  set go-=M
  set guioptions-=T
  set guioptions-=m
  set guioptions-=L
  set guioptions-=r
  set guifont=Monospace\ 14
  "set guifont=Ubuntu\ Mono\ 16
  "set guifont=Source\ Code\ Pro\ 16
  " Disable all blinking:
  set guicursor+=a:blinkon0
  set mouse=a
  let g:indent_guides_auto_colors = 1
  let g:solarized_termcolors=256
elseif has('nvim')
  let g:airline_theme='gruvbox'
  let g:indent_guides_auto_colors = 0
  set termguicolors
else "normal vim
  set t_Co=256
  set term=xterm-256color
  let g:indent_guides_auto_colors = 0
endif

if has('multi_byte') && &encoding ==# 'utf-8'
	let &listchars = 'tab:▸,extends:❯,precedes:❮,nbsp:±'
  let &fillchars = 'diff:▚'
  "let &showbreak = '↪ '
  highlight VertSplit ctermfg=242
  augroup vimrc
    autocmd InsertEnter * set listchars-=trail:⣿
    autocmd InsertLeave * set listchars+=trail:⣿
  augroup END
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
  let &fillchars = 'stlnc:#'
  let &showbreak = '-> '
  augroup vimrc
    autocmd InsertEnter * set listchars-=trail:.
    autocmd InsertLeave * set listchars+=trail:.
  augroup END
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" MAPPINGS """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Edit {v}im {d}ot file in new tab
nnoremap <leader>vd :tabedit ~/.vimrc<cr>
"" reload vimdot
nnoremap <leader>vdr :source ~/.vimrc<cr>
"" Moving
nnoremap <S-j> 5gj
nnoremap <S-k> 5gk
vnoremap <S-j> 5gj
vnoremap <S-k> 5gk
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

nnoremap H g^
vnoremap H g^
nnoremap L g$
vnoremap L g$

" Merge
noremap M J

"" Go to next closing bracket (start of).
function! FirstBracket(brac)
  set nohlsearch
  if a:brac == "]"
    exe "normal /{\<cr>l" 
  else
    exe "normal ?{\<cr>nl" 
  endif
  set hlsearch
endfunction
noremap <silent> <localleader>] :call FirstBracket("]")<cr>
noremap <silent> <localleader>[ :call FirstBracket("[")<cr>

"" Registers
"" Copying with Y from cursor to EOL
nnoremap Y y$
" paste from clipboard in insert
inoremap <C-v> <C-r>+

"" Newline without ins mode
"nnoremap <C-i>o i<CR><ESC><ESC>
nnoremap go o<ESC>
nnoremap <silent> <C-s> :wa<CR>:if &syntax=='off' <bar> syntax on <bar> endif<cr>
"" Escape! C-c does not trigger insertleave
inoremap <C-c> <esc><esc>l
inoremap df <esc>l
inoremap fd <esc>l

"" Searching and centering, jumping
nnoremap n  nzz
nnoremap N  Nzz
nnoremap *  *zz
nnoremap #  #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap }  }zz
nnoremap {  {zz
nnoremap ]] ]]zz
nnoremap [[ [[zz
nnoremap [] []zz
nnoremap ][ ][zz

nnoremap '  `
nnoremap `  '

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"" Moving between windows
"" set C-j or k defaults off
let g:BASH_Ctrl_j='off'
let g:BASH_Ctrl_k='off'
""noremap <C-j> <C-W>j
""noremap <C-k> <C-W>k
""noremap <C-h> <C-W>h
""noremap <C-l> <C-W>l

"" windows
"" increase window height
nnoremap + <C-W>+
"" decrease
nnoremap - <C-W>-
"" resize the windows
nnoremap <left>  2<c-w><
nnoremap <right> 2<c-w>>
nnoremap <up>    2<c-w>+
nnoremap <down>  2<c-w>-

"" Useful mappings for managing tabs
nnoremap <leader>tn :tabnew<cr>:Startify<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>q  :tabprevious<cr>
nnoremap <leader>e  :tabnext<cr>
"" Useful mappings for managing windows
nnoremap <C-w>n <C-w>n:Startify<cr>

"" BUFFERS
"" Mappings to access buffers (don't use "\p" because a
"" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>[ :bp<CR>
nnoremap <Leader>] :bn<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
"" <leader>bd is Bclose in vim plugins
nnoremap <silent> <leader>ba :bufdo bd<cr>:Startify<cr>:NERDTreeToggle<cr><C-w><C-w>
"" It's useful to show the buffer number in the status line.
"" set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"" refresh buffer
nnoremap <f4> :windo e<cr>

"" SPELLING
"" Pressing \ss will toggle and untoggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

"" Code folding
nnoremap <leader>z za
"map <leader>n :set invnumber<cr>

"" Current Date
nnoremap <F3> "=strftime("%Y-%m-%d")<CR>P
inoremap <F3> <C-R>=strftime("%Y-%m-%d")<CR>
"" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"" NO ARROWKEYS FOR U!
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
inoremap <right> <nop>

"" saving and quiting
command! WQ wq

command! Wq wq
command! Wa wa
command! W  w
command! Q  q
command! Qa qa

"" Sudo saving :WS
command! WS w !sudo tee % > /dev/null

"" opening
command! T tabedit

"" Restore from crash
nnoremap <Leader>do :DiffOrig<cr>
nnoremap <leader>dc :q<cr>:diffoff<cr>:exe "norm! ".g:diffline."G"<cr> 

colorscheme gruvbox
autocmd GUIEnter * set visualbell t_vb=
