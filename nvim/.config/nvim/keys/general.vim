" Set the leader key
let g:mapleader = ' '
let g:maplocalleader = '\\'

" Map ESC in insert mode
imap jk <esc>

" Map command line mode to ; and swap : with ;
nnoremap ; :
vnoremap ; :
nnoremap : ;

" Move by visual line when wrapping (not real lines)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
inoremap <expr><Down> pumvisible() ? '<C-n>' : '<C-o>gj'
inoremap <expr><Up> pumvisible() ? '<C-p>' : '<C-o>gk'

" Move in completion menu with (C-j,C-k)
inoremap <expr><C-j> pumvisible() ? '<C-n>' : '<C-j>'
inoremap <expr><C-k> pumvisible() ? '<C-p>' : '<C-k>'

" Do not show stupid q: window
nnoremap q: <nop>

" Highlight last inserted/yanked text
nnoremap gV `[v`]

" Act like D and C
nnoremap Y y$

" Remap begin & end of line
nnoremap H ^
nnoremap L $

" Search will center window on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Center window when moving up and down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Print full path
nnoremap <C-p> :echo expand("%:p")<cr>

" Copying selection with the mouse
vnoremap <LeftRelease> "+ygv

" Paste inline from clipboard
inoremap <c-p> <esc>:set paste<cr>"+p:set nopaste<cr>a

" Upper case word
inoremap <c-u> <esc>mmviwU`ma
nnoremap <leader>u mmviwU`m

" Lower case word
inoremap <c-l> <esc>mmviwu`ma
nnoremap <leader>l mmviwu`m

" Switch between the last two files
nnoremap <leader>sw <c-^>

" Map save, exit and close buffer
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>b :bd<cr>

" Buffers movement
nnoremap <leader>] :bnext<cr>
nnoremap <leader>[ :bprev<cr>

" Source vim configurations
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" Functions keys
nnoremap <F1> :setlocal spell! spell?<cr>
nnoremap <silent><F3> :call ToggleList("Quickfix List", 'c')<cr>
nnoremap <silent><F4> :call ToggleList("Location List", 'l')<cr>

" NERDTree
if PluginExist("nerdtree")
  nnoremap <leader>t :NERDTreeToggle<cr>
endif

" Far
if PluginExist("far.vim")
  nnoremap <leader>ff :F<space>
  nnoremap <leader>fr :Far<space>
  nnoremap <leader>fi :Fardo<cr>
  nnoremap <leader>fu :Farundo<cr>
endif

" FZF
if PluginExist("fzf.vim")
  nnoremap <leader>oo :Files<CR>
  nnoremap <leader>og :GFiles<CR>
  nnoremap <leader>od :GFiles?<CR>
  nnoremap <leader>ob :Buffers<CR>
  nnoremap <leader>om :Marks<CR>
  nnoremap <leader>oM :Maps<CR>
  nnoremap <leader>oh :History<CR>
  nnoremap <leader>o; :History:<CR>
  nnoremap <leader>o/ :History/<CR>
  nnoremap <leader>os :Snippets<CR>
  nnoremap <leader>oc :BCommits<CR>
  nnoremap <leader>oC :Commands<CR>
  nnoremap <leader>of :Filetypes<CR>
endif

" Fugitive (Git wrapper)
if PluginExist("vim-fugitive")
  nnoremap <leader>gd :Gdiff<CR>
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>
  nnoremap <leader>gb :Gblame<CR>
  nnoremap <leader>gl :Glog<CR>
  nnoremap <leader>gw :Gwrite<CR>
  nnoremap <leader>gr :Gread<CR>
endif

" GitGutter
if PluginExist("vim-gitgutter")
  nmap ]h <Plug>(GitGutterNextHunk)
  nmap [h <Plug>(GitGutterPrevHunk)
  nmap <leader>hp <Plug>(GitGutterPreviewHunk)
  nmap <leader>hs <Plug>(GitGutterStageHunk)
  nmap <leader>hu <Plug>(GitGutterUndoHunk)
  nnoremap <silent><F2> :GitGutterLineHighlightsToggle<CR>
endif

" CoC
if PluginExist("coc.nvim")
  nnoremap <leader>es :call OpenSnippetFile()<cr>
  nnoremap <leader>ec :CocConfig<cr>

  " Diagnostics Navigate
  nmap <silent>[[ <Plug>(coc-diagnostic-prev)
  nmap <silent>]] <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent>gd <Plug>(coc-definition)
  nmap <silent>gy <Plug>(coc-type-definition)
  nmap <silent>gi <Plug>(coc-implementation)
  nmap <silent>gr <Plug>(coc-references)

  " Use K for show documentation in preview window
  nnoremap <silent>K :call <SID>showDocumentation()<cr>

  " rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for do codeAction of selected region, current line or motion. ex: `<leader>aap` for current paragraph
  vmap <leader>a <Plug>(coc-codeaction-selected)
  nmap <leader>ac <Plug>(coc-codeaction)

  " Fix autofix problem of current line
  nmap <leader>af <Plug>(coc-fix-current)

  " Prettier format action
  nnoremap <leader>fd :<C-u>CocCommand prettier.formatFile<cr>

  " Commands List
  nnoremap <leader>c :<C-u>CocList commands<cr>

  " Find symbol of current document
  nnoremap <leader>s :<C-u>CocList outline<cr>

  " Find symbol of workspace
  nnoremap <leader>S :<C-u>CocList -I symbols<cr>

  function! s:showDocumentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    elseif &filetype == 'tmux'
      call tmux#man()
    else
      call CocAction('doHover')
    endif
  endfunction
endif

