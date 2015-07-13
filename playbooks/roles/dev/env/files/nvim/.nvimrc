" Source: http://stackoverflow.com/questions/164847/what-is-in-your-vimrc [1]

"""""""""""""""""""""""""""
" Vim behaviours
"""""""""""""""""""""""""""
set nocompatible
set nowrap

" map leader from default \ to , for easy keypress
let mapleader = ','

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=utf-8,latin1
endif


if has('nvim')
    runtime! plugin/python_setup.vim
endif
" Automatically reload .vimrc
autocmd! BufWritePost .nvimrc source %

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" no swaps and backups
set noswapfile
set nobackup

" Key bindings
"use ;<x> instead of :<x>
nnoremap ; :

" vim * ingores swp and .o files
set wildignore=*.swp,*.o,.svn,.git,*.a,*.class,*.obj,*.jgp,*.png,*.pyc

" <tab> complete only up to the point of ambiguity
" also show the possible completion list
set wildmenu
set wildmode=longest:list

" show filename in xterm's title
set title


""""""""""""""""""""""""""""""
" auto spellcheck for docs
"""""""""""""""""""""""""""""
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
autocmd FileType md,rst,txt,adoc setlocal spell


" This shows what you are typing as a command.  I love this!
set showcmd

" Folding Stuf
set foldmethod=manual

" reload the file if it changes outside vim
set autoread

" current buffer need not be saved e# just works
set hidden


""""""""""""""""""""""""""""""""
" clipboard
""""""""""""""""""""""""""""""""
" allow copy-paste from clipboard
set clipboard=unnamed

" allow deleting selection without updating the clipboard (yank buffer)
" vnoremap x "_x
" vnoremap X "_X
set pastetoggle=<F2>


""""""""""""""""""""""""""""
" Line numbers
""""""""""""""""""""""""""""
set ruler
set numberwidth=3
set cpoptions+=n
nmap <C-M> :set invnumber<CR>
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

function! NumberToggle()
    set invrelativenumber
endfunc

nnoremap <C-l> :call NumberToggle()<cr>

set tw=80 " width of the doc (used by gd???)
set fo-=t " do not automatically wrap text when typing


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color column > 80
""""""""""""""""""""""""""""""""
" highlight ColorColumn  ctermbg=55
" set colorcolumn=80

let &colorcolumn="80,".join(range(120,999),",")
call matchadd('ColorColumn', '\%81v', 55)


""""""""""""""""""""""""
"  searching
""""""""""""""""""""""""

" ignorecase while search unless there is a change in the case
set ignorecase
set smartcase

set hlsearch
set incsearch
set showmatch

" press leader-n to disable the highlighted search
nmap <silent> <leader>s :silent :nohlsearch<CR>

""""""""""""""""""""""""""""""""""""""
" indentation
""""""""""""""""""""""""""""""""""""""
" NOTE: use editorconfig plugin and .editorconfig file
set noautoindent smartindent
set expandtab
set nojoinspaces
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4


""""""""""""""""""""""""""""
" history
""""""""""""""""""""""""""""
set history=1000
set undolevels=1000



"""""""""""""""""""""""""""""""""""""""""""""""""
" Custom filetypes syntax highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType j2 set filetype=jinja
autocmd FileType yml set filetype=yaml

if &diff
    " only interested in diff colours
    syntax off
endif

"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1


" use w!! to sudo save file
cmap w!! w !sudo tee % >/dev/null

" shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

""""""""""""""""""""""""""
" scroll faster
""""""""""""""""""""""""""
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


""""""""""""""""""""""""""""""""""""""""""
"  use buffer instead of tabs
""""""""""""""""""""""""""""""""""""""""""
" To open a new empty buffer
nmap <leader>n :enew<cr>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>x :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>


" sort
vnoremap <Leader>^ :sort<cr>

""""""""""""""""""""""""""""""""""
" whitespace
""""""""""""""""""""""""""""""""""
" NOTE: MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=13 guibg=magenta
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

",w catch trailing whitespace press <leader>w
nmap <silent> <leader>w :set nolist!<CR>

" Insert date by pressing <F2>
inoremap <F2> <C-R>=strftime("%c")<CR>



""""""""""""""""""""""""""""
" zenburn
""""""""""""""""""""""""""""
set t_Co=256
let g:zenburn_high_Contrast=1
let g:zenburn_alternate_Visual=1
colors zenburn


"""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""

call plug#begin('~/Developer/Tools/Vim/plugins')

Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-easy-align'
Plug 'bling/vim-airline'
Plug 'L9'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'FuzzyFinder'
Plug 'delimitMate.vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'Yggdroot/indentLine'
Plug 'jwhitley/vim-matchit'
Plug 'editorconfig-vim'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'

Plug 'Valloric/YouCompleteMe', {'do': './install.sh'}
Plug 'marijnh/tern_for_vim', {'for': ['javascript'], 'do': 'npm install'}

Plug 'klen/python-mode', { 'for': ['python'] }
Plug 'html-xml-tag-matcher', { 'for': ['html', 'xml'] }
Plug 'chase/vim-ansible-yaml', { 'for': ['ansible', 'yaml'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'pangloss/vim-javascript', { 'for': ['js', 'html', 'css'] }
Plug 'dbakker/vim-projectroot'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'fidian/hexmode'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'stephpy/vim-yaml'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
call plug#end()


""""""""""""""""""""""""""""""
" vimwiki stuff "
""""""""""""""""""""""""""""""

" Run multiple wikis "
let g:vimwiki_list = [
    \{'path': '~/Dropbox/Private/Data/VimWiki/work.wiki'},
    \{'path': '~/Dropbox/Private/Data/VimWiki/developer.wiki'},
    \{'path': '~/Dropbox/Private/Data/VimWiki/personal.wiki'},
\]

au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki nmap <leader>d :VimwikiMakeDiaryNote

function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

:autocmd FileType vimwiki nmap <leader>c :call ToggleCalendar()<CR>

""""""""""""""""""""""""""""""
" history: gundo
""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>


""""""""""""""""""""""""""""""
" nerdcommenter
""""""""""""""""""""""""""""""
let NERDSpaceDelims = 1

""""""""""""""""""""""""""""""
" NertTree
""""""""""""""""""""""""""""""
map <Leader>t <esc>:NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" jedi-vim don't show doc
""""""""""""""""""""""""""""""
autocmd FileType * setlocal completeopt-=preview

"""""""""""""""""""""""""""""""
" You Complete Me
"""""""""""""""""""""""""""""""
" do not load ycm for ruby
"augroup plug_xtype
  "autocmd FileType * if expand('<amatch>') != 'ruby' | call plug#load('YouCompleteMe') | execute 'autocmd! plug_xtype' | endif
"augroup END
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

"Utlisnips and YCM
"src: http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme/18685821#18685821

"this mapping Enter key to <C-y> to chose the current highlight item
"and close the selection list, same as other IDEs.
"CONFLICT with some plugins like tpope/Endwise
"
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

""""""""""""""""""""""""""""""""
" Vim airline
""""""""""""""""""""""""""""""""
" set laststatus=2
let g:airline_theme = 'ubaryd'
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':p'

"""""""""""""""""""""""""""""
" syntastic
"""""""""""""""""""""""""""""
let g:syntastic_auto_loc_list=0
"let g:syntastic_disabled_filetypes=['py' ]
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perlcritic', 'perl', 'podchecker']
""""""""""""""""""""""""""""""""""
"  Unite.vim
""""""""""""""""""""""""""""""""""

let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 12
let g:unite_source_history_yank_enable = 1

"let g:unite_abbr_highlight = 'normal'
call unite#filters#matcher_default#use(['matcher_fuzzy', 'sorter_rank'])
call unite#custom#profile('default', 'context', { 'marked_icon':'✓'})
call unite#custom_default_action('directory,directory_mru', 'cd')

nnoremap <space>F :<C-u>Unite -start-insert -auto-resize file<CR>
nnoremap <space>U :<C-u>Unite -buffer-name=mru  -start-insert file_mru<cr>
nnoremap <space>s :<C-u>Unite -start-insert -auto-resize buffer<CR>
nnoremap <space>r :<C-u>Unite register<CR>
nnoremap <space>y :<C-u>Unite history/yank<CR>

nnoremap <space>e :<C-u>UniteWithBufferDir -start-insert -auto-resize file<CR>

nnoremap <space>a :<C-u>UniteWithProjectDir -buffer-name=files -auto-resize -start-insert file_rec/async:!<cr>
nnoremap <space>B :<C-u>UniteWithProjectDir -start-insert -auto-resize buffer<CR>
nnoremap <space>f :<C-u>UniteWithProjectDir -start-insert -auto-resize file_rec/async:!<CR>
nnoremap <space>g :<C-u>UniteWithProjectDir -start-insert grep:.<cr>
nnoremap <space>o :<C-u>UniteWithProjectDir -auto-resize outline<CR>
nnoremap <space>u :<C-u>UniteWithProjectDir -buffer-name=mru  -start-insert file_mru<cr>

call unite#custom_source(
  \ 'file_rec,file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', join([
        \ '\.git/',
        \ '\.sass-cache/',
        \ 'node_modules/',
        \ 'bower_components/',
        \ 'LOCAL_INSTALL/',
        \ '.ropeproject/',
        \ '.__pycache__/',
        \ '\.d',
    \ ], '\|')
\)

function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1

  " Enable navigation with control-u and control-i in insert mode
  imap <buffer> <C-u>   <Plug>(unite_select_next_line)
  imap <buffer> <C-i>   <Plug>(unite_select_previous_line)
  nmap <buffer> <ESC> <Plug>(unite_exit)

  let b:actually_quit = 0
  setlocal updatetime=2
  au! InsertEnter <buffer> let b:actually_quit = 0
  au! InsertLeave <buffer> let b:actually_quit = 1
  au! CursorHold  <buffer> if exists('b:actually_quit') && b:actually_quit | close | endif
endfunction

"Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()

function! Unite_ctrlp()
    execute ':Unite  -buffer-name=files -start-insert buffer file_rec/async:'.ProjectRootGuess().'/'
endfunction
nnoremap <C-P> :call Unite_ctrlp()<cr>

""""""""""""""""""""""""""
" py-mode
""""""""""""""""""""""""""
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"  Rope mode on unless I am using Jedi vim
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pylint,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Now we just enable the menu and pydoc preview to get the most useful
" information out of the code completion
set completeopt=menuone,longest,preview


""""""""""""""""""""""""""""""""""""
" Yggdroot/indentLine
""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┆'
let g:indentLine_first_char = '│'
let g:indentLine_color_term = 236
let g:indentLine_showFirstIndentLevel = 0

highlight ColorColumn ctermbg=235 guibg=#2c2d27



set shell=/bin/sh

