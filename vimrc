set nocompatible                                      " Vim is not vi 
so ~/.vim/plugins.vim                                 " Manage plugins in their own file
syntax on                                             " Show syntax highlighting

filetype on                                           " Enable filetype detection
filetype plugin on                                    " Enable filetype-specific plugins
filetype indent on                                    " Enable filetype-specific indenting
set backspace=start,eol                               " Allow backspacing over the start of insert
let mapleader = "\<Space>"                            " Set leader key to space
"let g:mapleader = ','
runtime macros/matchit.vim
let g:vim_markdown_conceal = 0                        " markdown
"set window                                            " Set window title by default
set modifiable                                        " Make buffer modifiable
set autoindent                                        " Vim preserves the same level of indentation each time we create a new line
set copyindent                                        " copy the previous indentation on autoindenting (look for in google)
set ts=2                                              " Set indent to 2 spaces
set shiftwidth=2
set expandtab                                         " Use spaces, not tab characters
set cursorline                                        " Hightlight current line
set autowriteall                                      " Automatically save file when switching buffers
set t_CO=256                                          " Use 256 colors (useful for terminal vim)
set title                                             " change the terminal's title
set ruler                                             " Show cursor position all the time
set showcmd
set relativenumber                                    " Show line number relative to current line
set number                                            " Show line number
set clipboard=unnamed                                 " Use the system clipboard
set hidden                                            " preserve undo buffers http://usevim.com/2012/10/19/vim101-set-hidden/
set history=1000         " remember more commands and search history "http://nvie.com/posts/how-i-boosted-my-vim/
set undolevels=1000      " use many muchos levels of undo
set list lcs=tab:\|\ 
set whichwrap=b,s,h,l,[,],<,> "Allow specified keys to move to the previous/next line

" search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=** " para buscar recursivamente con :find

" Display all matching files when me tab complete
set wildmenu                                          
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules
set hlsearch                                          " highlight search
set incsearch                                         " Instantly take you to word you are searching for (first result)
set ignorecase                                        " Ignore case when searching...
set smartcase                                         " ...except if we input a capital letter
let NERDTreeMouseMode=3                               " One click for navigation
let NERDTreeShowHidden=1                              " Show hidden files in Nerdtree
let NERDTreeHijackNetrw=1                             " Use NerdTree instead of Netrw in Netrw
set linebreak
set splitright                                        " Open new split panes to right
set splitbelow                                        " Open new split panes to the bottom
set noerrorbells visualbell t_vb=                     " No bells!
set laststatus=2                                      " See the current filename in vim
set noswapfile

let g:ctrlp_show_hidden = 1                           " Show hidden files like .rspec

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

if has('nvim')
  tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
endif

"clever-f
let g:clever_f_smart_case = 1
let g:clever_f_across_no_line = 1

set suffixesadd+=.scss

"indent guides 
let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgray   ctermbg=254
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=253

"http://bit.ly/2eOP2wL
" [buffer number] followed by filename:

" http://nvie.com/posts/how-i-boosted-my-vim/
" nmap <silent> ,/ :nohlsearch<CR>                      
"set laststatus=2                                      " Always display the status line
" set textwidth=80 | set colorcolumn=+1                 " Make it obvious where 80 characters is

" testing undo feature for going back to with undo after saving 
" http://stackoverflow.com/questions/17936130/vim-undo-undo-changes-after-file-write
" if has('persistent_undo')      "check if your vim version supports it
"   set undofile                 "turn on the feature  
"   set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
" endif 

" https://github.com/r00k/dotfiles/blob/master/vimrc
"map <Leader>bb :!bundle install<cr>
"nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>

" Create tags file
command! MakeTags !ctags -R .

" Mappings {{{

" '|' pipe symbol separates commands in vim (used to add comments on the same line)
nnoremap <leader>z <C-z>|                                  " Go to shell (suspend)
vnoremap // y/<C-R>"<CR>
vnoremap /' y:Ag! <C-R>"<CR>

nnoremap <silent> = V`]=|                             " Auto indent pasted code in vim
nmap <leader>vi :tabedit $MYVIMRC<cr>|                " Shortcut to edit .vimrc
nmap <leader>sn :e ~/.vim/snippets/|                  " Open snippets path. Fill in which one to access
map <leader>a :Ag!<space>|                            " Shortcut for Silver Search
nnoremap Z ZZ|                                        " Exits saving file
nnoremap Q ZQ|                                        " Exits without saving file
map <leader>m :!open -a "Marked 2" %<cr><cr>|         " Open markdown preview in Marked app
" map <leader>z <C-z>|                                  " Go to shell (suspend)
nnoremap <leader><leader> <c-^>|                      " Remap to switch between last opened file
nnoremap <slient> <Esc> :nohlsearch<Bar>:echo<CR>|    " Cancel search with Esc
map <leader>t :NERDTreeToggle<CR>|                    " Open Nerdtree
nnoremap <leader>c :ccl<CR>|                          " cl[ose] quickfix window
nnoremap <leader>o :cope<CR>|                         " [ope]n quickfix window

" `vv` to highlight just the text (i.e. no indents) in a line
map vv ^vg_

"command line mappings
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
"ref: https://www.youtube.com/watch?v=2svdeMGyw7A#t=33.764919
" cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
" cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

" Repeat last macro if in a normal buffer by hiting enter.
" nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

" my custom pageups and pagedowns
nmap <leader>d LztM
nmap <leader>u HzbM

" bind capital K to grep word under cursor
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" turn off search highlighting. NOTE: choca con vim vinegar
nnoremap - :noh<cr>

" move line up or down http://vim.wikia.com/wiki/Moving_lines_up_or_down
nmap ∆ :m .+1<CR>==
nmap ˚ :m .-2<CR>==
imap ∆ <Esc>:m .+1<CR>==gi
imap ˚ <Esc>:m .-2<CR>==gi
vmap ∆ :m '>+1<CR>gv=gv
vmap ˚ :m '<-2<CR>gv=gv

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
" https://github.com/r00k/dotfiles/blob/master/vimrc#L138-L142
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" Open several files from the same directory. ref: http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Save in normal or insert mode with <C-s>
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" You can confirm that text is yanked correctly and see yanked text by highlighting
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

nnoremap j gj
vnoremap j gj
nnoremap gj j
vnoremap gj j

nnoremap k gk
vnoremap k gk
nnoremap gk k
vnoremap gk k

"Yank to end of line. (shift-D or shift-C applys to the end of the line. so shift-Y was missing)
noremap Y y$

" Yankround config {{{
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"}}}

" Theme Options {{{
" Paper color theme options
" set t_Co=256   " This may or may not be needed.
" set background=light
"colorscheme PaperColor
colorscheme dracula

let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }
set noshowmode "hide --INSERT-- because lightline handles it
"}}}

" Ctrlp Config {{{
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
"}}}

"Mouse Config {{{
if has('vim')
  " mouse enhanced also by the terminus plugin
  set ttyfast " Send more characters for redraws
  set mouse=a " Enable mouse use in all modes
  " Set this to the name of your terminal that supports mouse codes.
  " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
  set ttymouse=xterm2
endif
"}}}

" Status line config {{{
set statusline=[%n]\ %t
" for Syntastic messages:
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" show line#:column# on the right hand side
set statusline+=%=%l:%c
"}}}

" Syntastic config {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']
"}}}

" Eslint config {{{
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'

if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif

if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
  let g:syntastic_vue_eslint_exec = local_eslint
endif
"}}}

" The Silver Searcher https://robots.thoughtbot.com/faster-grepping-in-vim {{{
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"}}}

" Rename current file https://github.com/r00k/dotfiles/blob/master/vimrc#L313{{{
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

"map <Leader>n :call RenameFile()<cr>
"}}}

" Fashy config {{{
autocmd VimEnter,Colorscheme * :hi Flashy guibg=#197bb7 ctermbg=252
let g:operator#flashy#flash_time = 240
"}}}

" Breakline with Enter {{{
"nnoremap <CR> o<Esc>
"}}}

" EasyMotion Config {{{
"map <Leader>j <Plug>(easymotion-prefix)

" Enter by <Space> to excute faster & easily
"autocmd VimEnter,BufEnter * EMCommandLineNoreMap <Space> <CR>
" autocmd VimEnter,BufEnter * EMCommandLineNoreMap <C-j> <Space>

let g:EasyMotion_do_mapping = 0

" Or map prefix key at least(Default: <Leader><Leader>)
" map <Leader> <Plug>(easymotion-prefix)

" =======================================
" Find Motions
" =======================================
" Jump to anywhere you want by just `4` or `3` key strokes without thinking!
" `s{char}{char}{target}`
nmap s <Plug>(easymotion-overwin-f2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" =======================================
" Line Motions
" =======================================
" `JK` Motions: Extend line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" keep cursor column with `JK` motions
let g:EasyMotion_startofline = 0

" =======================================
" General Configuration
" =======================================
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
" Show target key with upper case to improve readability
let g:EasyMotion_use_upper = 1

" Jump to first match with space
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_do_shade = 0
let g:EasyMotion_startofline = 0

nmap ;L <Plug>(easymotion-overwin-line)

" Replace defaut
" smart f & F
omap f <Plug>(easymotion-bd-fl)
xmap f <Plug>(easymotion-bd-fl)
" =======================================
" Search Motions (todo: pending)
" =======================================
" Extend search motions with vital-over command line interface
" Incremental highlight of all the matches
" Now, you don't need to repetitively press `n` or `N` with EasyMotion feature
" `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
" :h easymotion-command-line
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
"}}}

" Unite {{{
" nnoremap [unite] <Nop>
" xnoremap [unite] <Nop>
" nmap ; [unite]
" xmap ; [unite
"
" Source
"nnoremap <silent> [unite]u :<C-u>Unite source -vertical -silent -start-insert<CR>
" Buffer
" nnoremap <silent> [unite]b :<C-u>Unite -silent buffer file_mru bookmark<CR>
" File List
" nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -silent -buffer-name=files file<CR>
" Search like ctrl-p
" nnoremap <silent> [unite]<Space> :<C-u>Unite file_rec/async:! -start-insert<CR>

"}}}

" Fold Basic Settings "{{{
"set foldenable "Enable fold
"set foldlevel=100 "Folds with a higher level will be closed
"

""old folding settings http://smartic.us/2009/04/06/code-folding-in-vim/
set foldmethod=indent   "fold based on indent
set foldnestmax=100      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
"}}}

" Fold {{{
"noremap [fold] <nop>
"nmap , [fold]
"vmap , [fold]
"
"noremap [fold]j zj
"noremap [fold]k zk
"noremap [fold]n ]z
"noremap [fold]p [z
""noremap <silent>[fold]h :<C-u>call <SID>smart_foldcloser()<CR>
"noremap [fold]l zo
"noremap [fold]L zO
"noremap [fold]a za
"noremap [fold]m zM
"noremap [fold]i zMzvzz
"noremap [fold]r zR
"noremap [fold]f zf
"noremap [fold]d zd
"}}}

" Leafcage/foldCC {{{
"set foldmethod=marker
"set foldtext=FoldCCtext()
"set foldcolumn=0
"set fillchars=vert:\|
"noremap [fold]g :<C-u>echo foldCC#navi()<CR>
" }}}

" Make search results appear on middle of screen
" todo: bug
" nnoremap n nzz
" nnoremap N Nzz
" nnoremap * *zz
" nnoremap # #zz
" nnoremap g* g*zz
" nnoremap g# g#zz

"https://vi.stackexchange.com/questions/10775/how-can-i-automatically-center-first-search-result/10776
"cnoremap <expr> <CR> getcmdtype() == '/' ? '<CR>zz' : '<CR>'

"visually select last pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"incsearch config {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"map z/ <Plug>(incsearch-fuzzy-/)
"map z? <Plug>(incsearch-fuzzy-?)
"map zg/ <Plug>(incsearch-fuzzy-stay)

" map z/ <Plug>(incsearch-fuzzyspell-/)
" map z? <Plug>(incsearch-fuzzyspell-?)
" map zg/ <Plug>(incsearch-fuzzyspell-stay)

" turns 'hlsearch' off automatically after searching-related motions.
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"}}}

"vim-asterisk config {{{
" map *   <Plug>(asterisk-*)
" map #   <Plug>(asterisk-#)
" map g*  <Plug>(asterisk-g*)
" map g#  <Plug>(asterisk-g#)
" map z*  <Plug>(asterisk-z*)
" map gz* <Plug>(asterisk-gz*)
" map z#  <Plug>(asterisk-z#)
" map gz# <Plug>(asterisk-gz#)
" }}}

" inner word changed to w. much faster.
" todo: bug
"onoremap w iw
"vnoremap w iw


" Auto Commands {{{

"Automatically source the .vimrc file on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

"todo: bug
"autocmd BufEnter * :syntax sync fromstart
" Fix syntax highlight in vue files
"
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

" augroup volt-syntax
"   autocmd!
"   au BufReadPost *.volt set syntax=html
" augroup END

" augroup volt-syntax
"   autocmd!
"   au BufReadPost *.pug set ft=pug
" augroup END

augroup hbs-syntax
  autocmd!
  autocmd BufReadPost *.hbs set syntax=html
augroup END

" autocmd Filetype scss setlocal ts=4 sts=4 sw=4
"expandtab is missing and it replaces tabs with spaces
"todo: bug
" augroup autoindenting
"   autocmd!
"   autocmd Filetype html setlocal ts=4 sts=4 sw=4
"   autocmd Filetype volt setlocal ts=4 sts=4 sw=4
"   autocmd Filetype php setlocal ts=4 sts=4 sw=4
"   autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
"   autocmd Filetype vue setlocal ts=4 sts=4 sw=4
" augroup END
" ref: http://stackoverflow.com/questions/1562633/setting-vim-whitespace-preferences-by-filetype
"
" Make folding views automatic http://vim.wikia.com/wiki/Make_views_automatic
" todo: bug
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview 

" Sticky shift in English keyboard."{{{
" https://gist.github.com/Shougo/288546
" Sticky key.
" inoremap <expr> ;  <SID>sticky_func()
" cnoremap <expr> ;  <SID>sticky_func()
" snoremap <expr> ;  <SID>sticky_func()

" function! s:sticky_func()
"     let l:sticky_table = {
"                 \',' : '<', '.' : '>', '/' : '?',
"                 \'1' : '!', '2' : '@', '3' : '#', '4' : '$', '5' : '%',
"                 \'6' : '^', '7' : '&', '8' : '*', '9' : '(', '0' : ')', '-' : '_', '=' : '+',
"                 \';' : ':', '[' : '{', ']' : '}', '`' : '~', "'" : "\"", '\' : '|',
"                 \}
"     let l:special_table = {
"                 \"\<ESC>" : "\<ESC>", "\<Space>" : ';', "\<CR>" : ";\<CR>"
"                 \}

"     if mode() !~# '^c'
"         echo 'Input sticky key: '
"     endif
"     let l:key = getchar()
    
"     if nr2char(l:key) =~ '\l'
"         return toupper(nr2char(l:key))
"     elseif has_key(l:sticky_table, nr2char(l:key))
"         return l:sticky_table[nr2char(l:key)]
"     elseif has_key(l:special_table, nr2char(l:key))
"         return l:special_table[nr2char(l:key)]
"     else
"         return ''
"     endif
" endfunction
"}}}

map J <Plug>(edgemotion-j)
map K <Plug>(edgemotion-k)

" prettier config {{{
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
" }}}

let g:jsx_ext_required = 0

" textobj-line
vmap aL <Plug>(textobj-line-a) 
vmap iL <Plug>(textobj-line-i)

"Arpeggioimap jk <Esc>
"Arpeggiocmap jk 
"Arpeggioimap JK <Esc>
"Arpeggiocmap JK 
" el barto was here, there, everywhere
