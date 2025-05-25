" source /apollo/env/envImprovement/var/vimrc
  "
  filetype plugin indent on
  syntax enable

  call plug#begin('~/.vim/plugged')

    " Tags
    " Plug 'ludovicchabant/vim-gutentags'
    " Plug 'majutsushi/tagbar'

    " Navigation
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'christoomey/vim-tmux-navigator'

    " In File
    Plug 'scrooloose/nerdcommenter'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'easymotion/vim-easymotion'
    Plug 'unblevable/quick-scope'

    " Vanity
    Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
    Plug 'vim-airline/vim-airline'
    Plug 'sheerun/vim-polyglot'
    Plug 'stephpy/vim-yaml'
    Plug 'liuchengxu/vim-which-key'
    Plug 'chrisbra/colorizer'

    " Source Control
    Plug 'tpope/vim-fugitive'
    Plug 'samoshkin/vim-mergetool'

  call plug#end()

  " Visual Setup
  if has('nvim') || has('termguicolors')
    set termguicolors
  endif

  colorscheme challenger_deep
  let g:challenger_deep_termcolors = 16

  " Variables
  let mapleader = "\<Space>"
  nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
  set timeoutlen=500

  nnoremap <leader>P :set invpaste paste?<CR>
  set pastetoggle=<leader>P
  set showmode

  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab

  " Display
  set number
  set rnu
  set showcmd
  set cursorline
  set colorcolumn=80

  set wildmenu
  set showmatch
  set hlsearch
  set noswapfile
  "set foldmethod=indent
  "set foldlevel=99
  "set clipboard=unnamedplus " Use Default Clipboard

  " Clear highlighting on escape in normal mode

  autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

  " ***************************** "
  " *** Plugin Configurations *** "
  " ***************************** "

  " let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]
  " let g:gutentags_trace = 1

  nmap <leader>vr :e ~/.vimrc<CR>
  nmap <leader>tc :e ~/.tmux.conf<CR>
  command ToggleNumbers :set invnumber invrelativenumber
  nmap <leader>cm :only <bar> :ToggleNumbers<CR>
  nmap <leader>tn :ToggleNumbers<CR>
  let @c="yyp^[kIconsole.log('^[A'\, ^[JA);^["
  let @s="^f{a ^[f}i ^["
  nmap <leader>nb $%zt

  " *** MergeTool *** "

  let g:mergetool_layout = 'mr'
  let g:mergetool_prefer_revision = 'local'
  nmap <leader>mt <plug>(MergetoolToggle)
  nmap <expr> <C-S-Left> &diff? '<Plug>(MergetoolDiffExchangeLeft)' : '<C-Left>'
  nmap <expr> <C-S-Right> &diff? '<Plug>(MergetoolDiffExchangeRight)' : '<C-Right>'
  nmap <expr> <C-S-Down> &diff? '<Plug>(MergetoolDiffExchangeDown)' : '<C-Down>'
  nmap <expr> <C-S-Up> &diff? '<Plug>(MergetoolDiffExchangeUp)' : '<C-Up>'

  function s:QuitWindow()
    " If we're in merge mode, exit
    if get(g:, 'mergetool_in_merge_mode', 0)
      call mergetool#stop()
      return
    endif

    if &diff
      " Quit diff mode intelligently...
    endif

    quit
  endfunction

  command! QuitWindow call s:QuitWindow()
  nnoremap <silent> <leader>q :QuitWindow<CR>

  " COC
  let g:coc_global_extensions = [
    \ 'coc-tsserver'
    \ ]

  " Clear highlighting on escape in normal mode
  nnoremap <esc> :noh<return><esc>

  " *********************** "
  " *** Regular Plugins *** "
  " ***********************


 " Plugin Configurations
  let NERDTreeWinSize=50
  let NERDTreeShowHidden=1
  nnoremap <Leader>3 :NERDTreeToggle<CR>
  nnoremap <leader>r :NERDTreeFind<cr>

  nnoremap <leader>8 :TagbarToggle<cr>

  " Trigger a highlight in the appropriate direction when pressing these keys:
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

  let g:ctrlp_custom_ignore = '\v[\/](git|DS_Store|coverage|node_modules|target|dist)|(\.(swp|ico|git|svn))'
  nnoremap <leader>e :CtrlPMRUFiles<cr>
  nnoremap <leader>B :CtrlPBuffer<cr>

  " FZF
  nnoremap <C-p> :Files<cr>
  nnoremap <leader>b :Buffers<cr>
  nnoremap <leader>m :Marks<cr>
  nnoremap <leader>h :History<cr>
  nnoremap <leader>g :GFiles?<cr>
  nnoremap <leader>l :Lines<cr>
  nnoremap <leader>bl :Blines<cr>

  " Use 256 colours (Use this setting only if your terminal supports 256 colours)
  set t_Co=256

  " Cntrl + hjkl mapping
  imap <C-h> <C-o>h
  imap <C-j> <C-o>j
  imap <C-k> <C-o>k
  imap <C-l> <C-o>l


  " *** COC Settings *** "

  " TextEdit might fail if hidden is not set.
  set hidden

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nmap <silent> ld <Plug>(coc-list-diagnostics)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


  " ************** "
  " Tagbar

  let g:tagbar_type_typescript = {
    \ 'ctagsbin' : 'tstags',
    \ 'ctagsargs' : '-f-',
    \ 'kinds': [
      \ 'e:enums:0:1',
      \ 'f:function:0:1',
      \ 't:typealias:0:1',
      \ 'M:Module:0:1',
      \ 'I:import:0:1',
      \ 'i:interface:0:1',
      \ 'C:class:0:1',
      \ 'm:method:0:1',
      \ 'p:property:0:1',
      \ 'v:variable:0:1',
      \ 'c:const:0:1',
    \ ],
    \ 'sort' : 0
  \ }
