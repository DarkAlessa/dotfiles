" Maintainer: Dark Alessa

set nocompatible                " Disable Vi compatibility
filetype on                     " Filetype must be 'on' before setting it 'off'
                                " otherwise it exits with a bad status and breaks
                                " git commit.
filetype off                    " Vundle Plugin Required
syntax on                       " Open highlight syntax

set fileencoding=utf-8          " File encode
set encoding=utf-8
set termencoding=utf-8
set number relativenumber       " Turn hybrid line numbers on
set ruler                       " Display status line/colmun number at buttom
set laststatus=2
set cursorline
set showcmd                     " Show (partial) command in status line.
set showmode
set autoread                    " Set to auto read when a file is changed from the outside
set autowrite                   " Automatically save before commands like :next and :make
set autoindent                  " Auto-indent new lines
set hidden                      " Hide buffers when they are abandoned
set mouse=a                     " Enable mouse usage (all modes)
set showmatch                   " Highlight matching brace
set visualbell                  " Use visual bell (no beeping)
set hlsearch                    " Highlight all search results
set smartcase                   " Enable smart-case search
set ignorecase                  " Always case-insensitive
set incsearch                   " Searches for strings incrementally
set smartindent                 " Enable smart-indent
set smarttab                    " Enable smart-tabs
set shiftwidth=4                " Number of auto-indent spaces
set softtabstop=4               " Number of spaces per Tab
set tabstop=4                   " Number of spaces that a <Tab> in the file counts for.
set expandtab                   " In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set backspace=indent,eol,start  " Allow backspacing over autoindent, eol and start
set foldmethod=manual
set lines=45 columns=140        " Window size
set listchars=tab:\ ,eol:
set splitright                  " splitting a window will put the new window right of the current one.
set splitbelow                  " splitting a window will put the new window below the current one.
set sessionoptions+=resize,unix,slash
"set shell=C:\Program\ Files\PowerShell\7\pwsh.exe

"---/ Terminal Debugger
let g:termdebug_wide = 110
let g:termdebug_popup = 0

"---/ Key mapping
imap jj <Esc>
nnoremap <Leader>c :!clear && g++ -std=c++23 -Wall -Werror -Wpedantic *.cpp -o app && app.exe <CR>

"---/ Move the line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <ESC> :m .+1<CR>==gi
inoremap <A-K> <ESC> :m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"////// Vim-plug
call plug#begin()

Plug 'w0rp/ale'                   " Check syntax in Vim with Language Server Protocol (LSP)
Plug 'jiangmiao/auto-pairs'       " Insert or delete brackets, parens, quotes in pair.
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'pboettch/vim-cmake-syntax'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'   " Vim plugin for intensely orgasmic commenting

call plug#end()                   " required
filetype plugin indent on         " required

"////// ALE
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#enabled = 1    " Use Vim-Airline statusline with ALE.
let g:ale_completion_enabled = 1            " Enable completion
let g:ale_virtualtext_cursor = 'current'
let g:ale_cpp_cc_executable = 'g++'
let g:ale_cpp_cc_options = '-std=c++23 -Wall -Werror -Wpedantic'

"/////////////////////////////////////////////////////////////////////////////////////////////
"/// Theme name : mimic //////////////////////////////////////////////////////////////////////
"/// By NUKE13          //////////////////////////////////////////////////////////////////////
"/// Date : 03/03/2023  //////////////////////////////////////////////////////////////////////
"/////////////////////////////////////////////////////////////////////////////////////////////
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'mimic'
"---------------------------------------------------
" term    attributes in a B&W terminal
" cterm   attributes in a color terminal
" ctermfg foreground color in a color terminal
" ctermbg background color in a color terminal
" gui     attributes in the GUI
" guifg   foreground color in the GUI
" guibg   background color in the GUI
"---------------------------------------------------

hi Normal            guifg=#d0d0d0 guibg=#1D1F1D gui=NONE ctermfg=252  ctermbg=236  cterm=NONE

hi Terminal          guifg=#d0d0d0 guibg=#1D1F1D gui=NONE ctermfg=252  ctermbg=236  cterm=NONE
hi Directory         guifg=#98C379 guibg=bg      gui=NONE ctermfg=150  ctermbg=236  cterm=bold
hi Question          guifg=#c98de6 guibg=bg      gui=NONE ctermfg=102  ctermbg=NONE cterm=NONE
hi Title             guifg=#00af87 guibg=bg      gui=NONE ctermfg=036  ctermbg=236  cterm=NONE
hi WildMenu          guifg=#121212 guibg=#87d7af gui=NONE ctermfg=233  ctermbg=115  cterm=NONE
hi ColorColumn       guifg=NONE    guibg=#262626 gui=NONE ctermfg=235  ctermbg=NONE cterm=NONE
hi SignColumn        guifg=NONE    guibg=bg      gui=NONE ctermfg=237  ctermbg=NONE cterm=NONE
hi Conceal           guifg=#b5b5b5 guibg=#474747 gui=NONE ctermfg=007  ctermbg=008  cterm=NONE
hi MatchParen        guifg=#87afd7 guibg=#585858 gui=NONE ctermfg=110  ctermbg=240  cterm=NONE
hi NonText           guifg=#585858 guibg=bg      gui=NONE ctermfg=240  ctermbg=NONE cterm=NONE
hi ToolbarLine       guifg=NONE    guibg=#808080 gui=NONE ctermfg=NONE ctermbg=008  cterm=NONE
hi ToolbarButton     guifg=#000000 guibg=#b5b5b5 gui=NONE ctermfg=000  ctermbg=007  cterm=bold
hi VertSplit         guifg=bg      guibg=bg      gui=NONE ctermfg=236  ctermbg=236  cterm=NONE
hi SpecialKey        guifg=#444444 guibg=bg      gui=NONE ctermfg=238  ctermbg=NONE cterm=NONE
hi Scrollbar         guifg=NONE    guibg=bg      gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi link EndOfBuffer  NonText

" Syntax   [:help E669] --------------------------------------------------------------------------------
" Group 1 Comment
hi Comment           guifg=#707070 guibg=bg gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
" Group 2 Constant
hi Constant          guifg=#d7af5f guibg=bg gui=NONE ctermfg=179 ctermbg=NONE cterm=NONE
hi String            guifg=#B8BF73 guibg=bg gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
hi Character         guifg=#B8BF73 guibg=bg gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
hi Number            guifg=#d787ff guibg=bg gui=NONE ctermfg=177 ctermbg=NONE cterm=NONE
hi Boolean           guifg=#d787ff guibg=bg gui=NONE ctermfg=098 ctermbg=NONE cterm=NONE
hi Float             guifg=#d787ff guibg=bg gui=NONE ctermfg=116 ctermbg=NONE cterm=NONE
" Group 3 Indentifier
hi Identifier        guifg=#ff8477 guibg=bg gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
hi Function          guifg=#dcf06a guibg=bg gui=NONE ctermfg=107 ctermbg=NONE cterm=NONE
" Group 4 Statement
hi Statement         guifg=#dcf06a guibg=bg gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi Conditional       guifg=#fba337 guibg=bg gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi Repeat            guifg=#fba337 guibg=bg gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
hi Label             guifg=#fba337 guibg=bg gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi Operator          guifg=#e4e4e4 guibg=bg gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi Keyword           guifg=#fba337 guibg=bg gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
hi Exception         guifg=#fba337 guibg=bg gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
" Group 5 Pre-Processor
hi PreProc           guifg=#85e0ff guibg=bg gui=NONE ctermfg=183 ctermbg=NONE cterm=NONE
hi Include           guifg=#d787ff guibg=bg gui=NONE ctermfg=140 ctermbg=NONE cterm=NONE
hi Define            guifg=#ff8477 guibg=bg gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi Macro             guifg=#ff8477 guibg=bg gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi PreCondit         guifg=#ff8477 guibg=bg gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
" Group 6 Type
hi Type              guifg=#85e0ff guibg=bg gui=NONE ctermfg=081 ctermbg=NONE cterm=NONE
hi StorageClass      guifg=#85e0ff guibg=bg gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
hi Structure         guifg=#85e0ff guibg=bg gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
hi Typedef           guifg=#85e0ff guibg=bg gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
" Group 7 Special
hi Special           guifg=#ff8477 guibg=bg gui=NONE ctermfg=174 ctermbg=NONE cterm=NONE
hi SpecialChar       guifg=#55747c guibg=bg gui=NONE ctermfg=066 ctermbg=NONE cterm=NONE
hi Tag               guifg=#55747c guibg=bg gui=NONE ctermfg=066 ctermbg=NONE cterm=NONE
hi Delimiter         guifg=#55747c guibg=bg gui=NONE ctermfg=066 ctermbg=NONE cterm=NONE
hi SpecialComment    guifg=#55747c guibg=bg gui=NONE ctermfg=066 ctermbg=NONE cterm=NONE
hi Debug             guifg=#55747c guibg=bg gui=NONE ctermfg=066 ctermbg=NONE cterm=NONE
" Group 8 
hi Ignore            guifg=#55747c guibg=bg gui=NONE ctermfg=066 ctermbg=NONE cterm=NONE
hi Todo              guifg=#5f5faf guibg=bg gui=NONE ctermfg=061 ctermbg=236  cterm=NONE
hi Underlined        guifg=#c98de6 guibg=bg gui=underline ctermfg=192  ctermbg=NONE cterm=underline

" Cursor -----------------------------------------------------------------------------------------------
hi Cursor            guifg=#171817 guibg=#fba337 gui=NONE ctermfg=235  ctermbg=228  cterm=NONE
hi CursorIM          guifg=#171817 guibg=#fba337 gui=NONE ctermfg=235  ctermbg=228  cterm=NONE
hi CursorColumn      guifg=NONE    guibg=#171817 gui=NONE ctermfg=NONE ctermbg=235  cterm=NONE
hi CursorLine        guifg=NONE    guibg=#171817 gui=NONE ctermfg=NONE ctermbg=235  cterm=NONE
hi CursorLineNr      guifg=#5fd7ff guibg=#171817 gui=NONE ctermfg=045  ctermbg=236  cterm=NONE
hi lCursor           guifg=bg      guibg=fg      gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi link CursorLineSign SignColumn
hi link CursorLineFold FoldColumn

" Line Number ------------------------------------------------------------------------------------------
hi LineNr            guifg=#707070 guibg=bg   gui=NONE ctermfg=240  ctermbg=236  cterm=NONE
hi LineNrAbove       guifg=NONE    guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi LineNrBelow       guifg=NONE    guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE

" Fold -------------------------------------------------------------------------------------------------
hi Folded            guifg=#d787af guibg=bg gui=NONE ctermfg=175 ctermbg=236 cterm=NONE
hi FoldColumn        guifg=#d787af guibg=bg gui=NONE ctermfg=175 ctermbg=236 cterm=NONE

" Search -----------------------------------------------------------------------------------------------
hi IncSearch         guifg=bg guibg=#fba337 gui=NONE ctermfg=140 ctermbg=240 cterm=NONE
hi Search            guifg=bg guibg=#fba337 gui=NONE ctermfg=140 ctermbg=240 cterm=NONE

" Tabline ----------------------------------------------------------------------------------------------
hi TabLine           guifg=#767676 guibg=#121212 gui=NONE ctermfg=243 ctermbg=233 cterm=NONE
hi TabLineSel        guifg=#d7af87 guibg=#121212 gui=NONE ctermfg=180 ctermbg=233 cterm=NONE
hi TabLineFill       guifg=#dfdfaf guibg=#121212 gui=NONE ctermfg=187 ctermbg=233 cterm=NONE

" Statusline -------------------------------------------------------------------------------------------
hi StatusLine        guifg=#87d7af guibg=#121212 gui=NONE ctermfg=115 ctermbg=233 cterm=NONE
hi StatusLineNC      guifg=#767676 guibg=#121212 gui=NONE ctermfg=243 ctermbg=233 cterm=NONE
hi StatusLineTerm    guifg=bg      guibg=#87ff5f gui=bold ctermfg=000 ctermbg=010 cterm=bold
hi StatusLineTermNC  guifg=bg      guibg=#87ff5f gui=NONE ctermfg=000 ctermbg=010 cterm=NONE

" Diff -------------------------------------------------------------------------------------------------
hi DiffAdd           guifg=#00d700 guibg=bg      gui=NONE ctermfg=040 ctermbg=236 cterm=NONE
hi DiffChange        guifg=#d7d700 guibg=bg      gui=NONE ctermfg=184 ctermbg=236 cterm=NONE
hi DiffDelete        guifg=#EE2F2F guibg=bg      gui=NONE ctermfg=160 ctermbg=236 cterm=NONE
hi DiffText          guifg=#2A2A2A guibg=#d7d700 gui=NONE ctermfg=236 ctermbg=184 cterm=NONE
hi link diffAdded    DiffAdd
hi link diffChanged  DiffChange
hi link diffRemoved  DiffDelete

" Messages ---------------------------------------------------------------------------------------------
hi Error             guifg=#EE2F2F guibg=bg gui=NONE ctermfg=196 ctermbg=235 cterm=NONE
hi ErrorMsg          guifg=#EE2F2F guibg=bg gui=NONE ctermfg=196 ctermbg=235 cterm=NONE
hi WarningMsg        guifg=#EE2F2F guibg=bg gui=NONE ctermfg=196 ctermbg=235 cterm=NONE
hi MoreMsg           guifg=#d0d0d0 guibg=bg gui=NONE ctermfg=252 ctermbg=235 cterm=NONE
hi ModeMsg           guifg=#d0d0d0 guibg=bg gui=NONE ctermfg=252 ctermbg=235 cterm=NONE

" Spell ------------------------------------------------------------------------------------------------
hi SpellBad          guifg=#ffffff guibg=#EE2F2F guisp=Red     ctermfg=007 ctermbg=167 cterm=NONE
hi SpellCap          guifg=#ffffff guibg=#005fdf guisp=Blue    ctermfg=007 ctermbg=026 cterm=NONE
hi SpellRare         guifg=#ffffff guibg=#00875f guisp=Magenta ctermfg=007 ctermbg=029 cterm=NONE
hi SpellLocal        guifg=#ffffff guibg=#8700af guisp=Cyan    ctermfg=007 ctermbg=091 cterm=NONE
 
" Pmenu ------------------------------------------------------------------------------------------------
hi Pmenu             guifg=#afd787 guibg=#3a3a3a gui=NONE ctermfg=150  ctermbg=237 cterm=NONE
hi PmenuSel          guifg=#3a3a3a guibg=#afd787 gui=NONE ctermfg=237  ctermbg=150 cterm=NONE
hi PmenuSbar         guifg=NONE    guibg=#444444 gui=NONE ctermfg=NONE ctermbg=238 cterm=NONE
hi PmenuThumb        guifg=NONE    guibg=#EE2F2F gui=NONE ctermfg=NONE ctermbg=167 cterm=NONE

" Visual -----------------------------------------------------------------------------------------------
hi Visual            guifg=#d0d0d0 guibg=bg gui=reverse,bold ctermfg=007 ctermbg=237 cterm=NONE
hi VisualNOS         guifg=#d0d0d0 guibg=bg gui=reverse,bold ctermfg=007 ctermbg=237 cterm=NONE

" Quickfix ---------------------------------------------------------------------------------------------
hi qfLineNr          ctermfg=238 ctermbg=NONE cterm=NONE guifg=#444444 guibg=NONE gui=NONE
hi qfSeparator       ctermfg=243 ctermbg=NONE cterm=NONE guifg=#767676 guibg=NONE gui=NONE
hi link QuickFixLine Search
