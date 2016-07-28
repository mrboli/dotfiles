call pathogen#infect()

"Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"Display
set number
set rnu
set showcmd
set cursorline
set colorcolumn=80

set wildmenu
set showmatch
set hlsearch

filetype indent on

syntax on

set clipboard=unnamed

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"set t_Co=256
let base16colorspace=256
set background=dark
colorscheme base16-ocean

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"Nerd Tree Right Status
set laststatus=2

"Airline
let g:airline_theme = "bubblegum"
let g:airline_powerline_fonts = 1

"Shortcuts

"NERD Tree

"Vim Shortcuts
map <C-H> :tabprevious<CR>
map <C-L> :tabnext<CR>
map <C-t> :tabnew<CR>
map <C-x> :tabclose<CR>

let mapleader = ","
map <Leader>s <Esc>:w<cr>
map <S-l> 5<C-W>>
map <S-h> 5<C-W><
map <S-k> <C-W>-
map <S-j> <C-W>+

"VIM
"     Go to last edit     | '.
"     Go back from jump   | ''
"     Swap chars          | xp
"     Visual to end block | o
"     Reselect Last Block | gv

"TMUX pane                
"       horizontal \"     | \"
"       swap panes        | o
"       toggle layouts    | <space> 
"       Move Pane         | { / }
"TMUX Window
"       find              | f
"       name              | ,
"       kill              | &
    
function DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction
