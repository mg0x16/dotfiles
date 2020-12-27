set termguicolors     " Enable true colors (24-bit)
silent! colorscheme molokai   " Set color scheme
set background=dark   " Use dark background

set number            " Show current line number
set relativenumber    " Show relative line number
set numberwidth=4     " Width of column showing numbers
set signcolumn=yes    " Make signcolumn always visible

set nowrap            " Disable line wrapping
set scrolloff=5       " Line offset to hit to scroll vertically
set sidescrolloff=5   " Column offset to hit to scroll horizontally
set sidescroll=1      " Number of columns to scroll horizontally

set splitright        " vsplit put the new buffer on the right of the current buffer
set splitbelow        " split put the new buffer below the current buffer

set tabstop=2         " Width of tab character
set softtabstop=2     " Amount of space to replace tab
set shiftwidth=2      " Amount of (tab/spaces) when indenting
set expandtab         " Insert spaces instead of tab
set shiftround        " Round indent (>>) to multiple of shiftwidth

set ignorecase        " Insensitive case searching
set smartcase         " If pattern has A-Z -> its sensitive, otherwise it is insensitive
set gdefault          " Use 'g' flag by default with :s/foo/bar/.

set hidden            " Allow unsaved background buffers (hides buffers instead of closing them)
set nobackup          " Don't create backups
set nowritebackup     " Don't create backups
set noswapfile        " No .swp files

set mouse=a           " Enable mouse
set spelllang=en      " Set english spellchecker

set updatetime=300    " Set updatetime (ex. git-gutter signs) to 100ms
set shortmess+=Fc     " Hide name of the file and completion info from command line
set diffopt+=vertical " Open diff window in vertical split

" Set cursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" Use ripgrep for all the things
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

if has('nvim')
  set inccommand=split  " Incremental live preview for :substitute
endif

" Set CLIPBOARD not PRIMARY
set clipboard=unnamedplus

" Set completion for menu
set completeopt=longest,menuone

" Cache undo
set undofile

