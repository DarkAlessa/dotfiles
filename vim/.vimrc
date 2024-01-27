vim9script
# Maintainer: Dark Alessa

set nocompatible                # Disable Vi compatibility 
filetype on                     # Filetype must be 'on' before setting it 'off'
                                # otherwise it exits with a bad status and breaks
                                # git commit.
filetype off                    # Vundle Plugin Required
syntax on                       # Open highlight syntax

set fileencoding=utf-8          # File encode
set encoding=utf-8
set termencoding=utf-8
set number relativenumber       # Turn hybrid line numbers on
set ruler                       # Display status line/colmun number at buttom
set laststatus=2
set cursorline
set showcmd                     # Show (partial) command in status line.
set showmode
set autoread                    # Set to auto read when a file is changed from the outside
set autowrite                   # Automatically save before commands like :next and :make
set hidden                      # Hide buffers when they are abandoned
set mouse=a                     # Enable mouse usage (all modes)
set showmatch                   # Highlight matching brace
set visualbell                  # Use visual bell (no beeping)
set hlsearch                    # Highlight all search results
set smartcase                   # Enable smart-case search
set ignorecase                  # Always case-insensitive
set incsearch                   # Searches for strings incrementally
set autoindent                  # Enable autoindent
set smartindent                 # Enable smart-indent
set cindent                     # Enable cindent (for C/C++)
set smarttab                    # Enable smart-tabs
set shiftwidth=4                # Number of auto-indent spaces
set softtabstop=4               # Number of spaces per Tab
set tabstop=4                   # Number of spaces that a <Tab> in the file counts for.
set expandtab                   # In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set backspace=indent,eol,start  # Allow backspacing over autoindent, eol and start
set foldmethod=manual
set lines=45 columns=140        # Window size
set listchars=tab:\ ,eol:
set splitright                  # splitting a window will put the new window right of the current one.
set splitbelow                  # splitting a window will put the new window below the current one.
set sessionoptions+=resize,unix,slash
set tags+=C:\msys64\home\nuker\tags # Ctags file / see ft-c-omni for help
set omnifunc=syntaxcomplete#Complete
#set shell=C:\Program\ Files\PowerShell\7\pwsh.exe

####### Terminal Debugger
g:termdebug_wide = 110
g:termdebug_popup = 0

####### Key mapping
imap jj <Esc>
nmap <F8> :TagbarToggle<CR>

####### Move the line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <ESC> :m .+1<CR>==gi
inoremap <A-K> <ESC> :m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

####### Vim-plug
call plug#begin()                 # required
# The default plugin directory will be as follows:
#   - Vim (Linux/macOS): '~/.vim/plugged'
#   - Vim (Windows): '~/vimfiles/plugged'
#   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'

Plug 'airblade/vim-gitgutter'     # Shows a git diff in the 'gutter' (sign column).
Plug 'scrooloose/nerdtree'        # NERDTree
Plug 'scrooloose/nerdcommenter'   # Vim plugin for intensely orgasmic commenting
Plug 'tpope/vim-fugitive'         # A Git wrapper
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'     # Multiple cursors plugin for vim/neovim
Plug 'easymotion/vim-easymotion'  # Vim motion on speed
Plug 'pboettch/vim-cmake-syntax'
Plug 'jiangmiao/auto-pairs'       # Insert or delete brackets, parens, quotes in pair.
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'                   # Check syntax in Vim with Language Server Protocol (LSP)
Plug 'majutsushi/tagbar'          # You must install the 'universal-ctags' package first.
Plug 'ctrlpvim/ctrlp.vim'         # Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'rust-lang/rust.vim'         # syntax highlighting of Rust
Plug 'mesonbuild/meson'           # meson build system

####### fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           # A command-line fuzzy finder.

####### Color and Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'     # use // colorscheme + name of scheme // for change scheme
Plug 'octol/vim-cpp-enhanced-highlight' # If you need modern C++ highlights, use bfrg/vim-cpp-modern together.
#Plug 'edkolev/tmuxline.vim'      # Simple tmux statusline generator with support for powerline symbols
#Plug 'ryanoasis/vim-devicons'    # Icon symbols : Must install Nerd-Font
#Plug 'tiagofumo/vim-nerdtree-syntax-highlight' # This is intended to be used with 'vim-devicons'

call plug#end()                   # required
filetype plugin indent on         # required

####### GUI Setting
if has('gui_running')             # :help feature-list
    if (has('win32') || has('win64')) && has('gui_win32')
        au GUIEnter * simalt ~x   # start with a maximized window
        set guioptions-=m         # disable Menu bar
        set guioptions-=T         # disable Tool bar
        set guioptions-=r         # disable Right-hand scroll bar
        set guioptions-=L         # disable Left-hand scroll bar
        set guifont=SauceCodePro\ NF:h9:W600:cANSI:qDRAFT
    endif
endif

####### Ctrlp.vim Plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
### Exclude files or directories using Vim's wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     # Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  # Windows

####### EasyMotion Setting
### default is <Leader><Leader> or \\ keys
map <Leader> <Plug>(easymotion-prefix)
### <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
### s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
### Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
### Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

####### NERDTree Setting
g:NERDTreeShowHidden = 1
g:NERDTreeDirArrowExpandable = '■'
g:NERDTreeDirArrowCollapsible = '□'
g:NERDTreeChDirMode = 2
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

### Start NERDTree and leave the cursor in it.
#autocmd VimEnter * NERDTree

### Start NERDTree and put the cursor back in the other window.
#autocmd VimEnter * NERDTree | wincmd p

### Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

### Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

### Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

### Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

### Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

### Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

####### ALE
g:ale_sign_error = ''
g:ale_sign_warning = ''
g:airline#extensions#ale#enabled = 1    # Use Vim-Airline statusline with ALE.
g:ale_completion_enabled = 1            # Enable completion
g:ale_virtualtext_cursor = 'current'
g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
g:ale_cpp_cc_executable = 'g++'
g:ale_cpp_cc_options = '-Iinclude -std=c++23 -Wall -Werror -Wpedantic'

####### vim-cpp-enhanced-highlight and vim-cpp-modern
g:cpp_member_highlight = 1              # Highlight struct/class member variables

####### Vim-fugitive
set diffopt+=vertical

####### Vim-gitgutter
set updatetime=100
g:gitgutter_max_signs = 500             # default value 500
g:gitgutter_sign_added              = '+'
g:gitgutter_sign_modified           = '~'
g:gitgutter_sign_removed            = '_'
g:gitgutter_sign_removed_first_line = '‾'
g:gitgutter_sign_modified_removed   = '~_'

####### flazz Vim-Colorschemes
colorscheme mimic # nord, tayra, fx, cake

####### Vim Airline Theme
set t_Co=256
g:airline_theme = 'minimalist'          # simple, powerlineish, papercolor, minimalist, luna, deus
g:airline#extensions#tabline#enabled = 1
g:airline#extensions#branch#enabled = 1
g:airline#extensions#tabline#enabled = 1
g:airline#extensions#tagbar#enabled = 1
g:airline_skip_empty_sections = 1
g:airline#extensions#tabline#left_sep = ' '
g:airline#extensions#tabline#left_alt_sep = '|'
g:airline_powerline_fonts = 1
g:airline_section_z = airline#section#create(['%3p%% ', "\uE0A1" .. ' %{line(".")}' .. '/%3L ' .. "\uE0A3" .. ' %{col(".")}'])

if !exists('g:airline_symbols')
    g:airline_symbols = {}
endif

####### Unicode symbols
g:airline_left_sep = '»'
g:airline_left_sep = '▶'
g:airline_right_sep = '«'
g:airline_right_sep = '◀'
g:airline_symbols.crypt = '🔒'
g:airline_symbols.maxlinenr = '␊'
g:airline_symbols.maxlinenr = '␤'
g:airline_symbols.linenr = '¶'
g:airline_symbols.branch = '⎇'
g:airline_symbols.paste = 'ρ'
g:airline_symbols.paste = 'Þ'
g:airline_symbols.paste = '∥'
g:airline_symbols.spell = '✓'
g:airline_symbols.notexists = '✗'
g:airline_symbols.whitespace = 'Ξ'

####### Powerline symbols
g:airline_left_sep = ''
g:airline_left_alt_sep = ''
g:airline_right_sep = ''
g:airline_right_alt_sep = ''
g:airline_symbols.branch = ''
g:airline_symbols.colnr = ' :'
g:airline_symbols.readonly = ''
g:airline_symbols.linenr = ' :'
g:airline_symbols.maxlinenr = '☰ '
g:airline_symbols.dirty = '⚡'

###### Compiler popup menu
def Run()
    if isdirectory('./builddir/')
        if system('dir /b .\builddir\*.exe') != system('dir /b abc.xyz')
            :execute ':!.\builddir\' .. system('dir /b .\builddir\*.exe')
        endif
    endif
    if isdirectory('./build/')
        if system('dir /b .\build\*.exe') != system('dir /b abc.xyz')
            :execute ':!.\build\' .. system('dir /b .\build\*.exe')
        endif
    endif
    if system('dir /b *.exe') != system('dir /b abc.xyz')
        :execute ':!' .. system('dir /b *.exe')
    else
        echo './ : File Not Found'
    endif
enddef

def Compiler()
    var exefile = system('ls *.exe')
    var menu: list<string> = [
        'GNU Build   │ g++ -std=c++23 -Wall -Werror -Wpedantic *.cpp -o app      G, g ',
        'CMake Setup │ cmake -S . -B ./build -G "MSYS Makefiles"                 S, s ',
        'CMake Build │ cmake --build ./build                                     C, c ',
        'Meson Setup │ meson setup ./builddir                                    E, e ',
        'Meson Build │ meson compile -C ./builddir                               M, m ',
        'Run         │                                                           R, r '
        ]
    popup_menu(menu, {
        #title: ' Compile options ',
        borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
        filter: (id, key) => {
            if key == 'G' || key == 'g'
                popup_close(id, 1)
            elseif key == 'S' || key == 's'
                popup_close(id, 2)
            elseif key == 'C' || key == 'c'
                popup_close(id, 3)
            elseif key == 'E' || key == 'e'
                popup_close(id, 4)
            elseif key == 'M' || key == 'm'
                popup_close(id, 5)
            elseif key == 'R' || key == 'r'
                popup_close(id, 6)
            else
                return popup_filter_menu(id, key)
            endif
            return true
        },
        callback: (_, result) => {
            if result == 1
                :!cls && g++ -std=c++23 -Wall -Werror -Wpedantic *.cpp -o app
            elseif result == 2
                :!cls && cmake -S . -B ./build -G "MSYS Makefiles"
            elseif result == 3
                :!cls && cmake --build ./build
            elseif result == 4
                :!cls && meson setup ./builddir
            elseif result == 5
                :!cls && meson compile -C ./builddir
            elseif result == 6
                Run()
            endif
        },
    })
enddef
nnoremap <Leader>c <ScriptCmd>Compiler()<CR>
