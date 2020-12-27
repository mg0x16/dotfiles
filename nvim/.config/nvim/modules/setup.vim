if empty(glob(expand("~/.local/share/nvim/site/autoload/plug.vim")))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" UI
Plug 'justinmk/molokai'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'brooth/far.vim'

" Movment
Plug 'easymotion/vim-easymotion'
Plug 'matze/vim-move'
Plug 'gorkunov/smartpairs.vim'
Plug 'romainl/vim-cool'

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mboughaba/i3config.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'dag/vim-fish'

" Utils
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'

" Initialize plugin system
call plug#end()

