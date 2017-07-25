set nocompatible                  
so ~/.vim/plugins.vim                                 " Manage plugins in their own file

syntax on                                             " Show syntax highlighting
" filetype plugin indent on
filetype on                                           " Enable filetype detection
filetype plugin on                                    " Enable filetype-specific plugins
filetype indent on                                    " Enable filetype-specific indenting
set backspace=start,eol                               " Allow backspacing over the start of insert

let mapleader = "\<Space>"                                   " Set leader key to space

runtime macros/matchit.vim

" markdown
let g:vim_markdown_conceal = 0
 
"set window                                            " Set window title by default
set modifiable                                        " Make buffer modifiable
set autoindent                                        " Set auto indent
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

" search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when me tab complete
set wildmenu                                          

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

" http://nvie.com/posts/how-i-boosted-my-vim/
" nmap <silent> ,/ :nohlsearch<CR>                      

" swap files - set them to a new tmp file to remove clutter from app
set noswapfile
"set laststatus=2                                      " Always display the status line

" set textwidth=80 | set colorcolumn=+1                 " Make it obvious where 80 characters is
" let g:GeeknoteFormat="markdown"                        "format mode when saving on :Geeknote


" testing undo feature for going back to with undo after saving 
" http://stackoverflow.com/questions/17936130/vim-undo-undo-changes-after-file-write

" if has('persistent_undo')      "check if your vim version supports it
"   set undofile                 "turn on the feature  
"   set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
" endif 
"
set laststatus=2                                       "see the current filename in vim

" Create tags file
command! MakeTags !ctags -R .

"indent guides 
let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgray   ctermbg=254
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=253

"clever-f
"
let g:clever_f_smart_case = 1
let g:clever_f_across_no_line = 1

set suffixesadd+=.scss


" Mappings {{{

" '|' pipe symbol separates commands in vim (used to add comments on the same line)
vnoremap // y/<C-R>"<CR>
vnoremap /' y:Ag! <C-R>"<CR>
nnoremap <silent> = V`]=|                             " Auto indent pasted code in vim
nmap <leader>vi :tabedit $MYVIMRC<cr>|                " Shortcut to edit .vimrc
nmap <leader>cu :e frontend/dev/js/src/ui.js<cr>|     " Shortcut 
nmap <leader>sn :e ~/.vim/snippets/|                  " Open snippets path. Fill in which one to access
map <leader>a :Ag!<space>|                            " Shortcut for Silver Search
nnoremap Z ZZ|                                        " Exits saving file
nnoremap Q ZQ|                                        " Exits without saving file
map <leader>m :!open -a "Marked 2" %<cr><cr>|         " Open markdown preview in Marked app
map <leader>z <C-z>|                                  " Go to shell (suspend)
nnoremap <leader><leader> <c-^>|                      " Remap to switch between last opened file
nnoremap <slient> <Esc> :nohlsearch<Bar>:echo<CR>|    " Cancel search with Esc
map <leader>t :NERDTreeToggle<CR>|                    " Open Nerdtree
nnoremap <leader>c :ccl<CR>|                          " cl[ose] quickfix window
nnoremap <leader>o :cope<CR>|                         " [ope]n quickfix window
"imap <C-y> <C-y>,|                                    " Emmet shortcut

" Move faster between windows. Instead of Ctrl-w + hjkl, just use Ctrl + hjkl
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

" `vv` to highlight just the text (i.e. no indents) in a line
map vv ^vg_

" ref: https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
" Keep search matches in the middle of the window.
"nnoremap n nzzzv
"nnoremap N Nzzzv

"command line mappings
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
"ref: https://www.youtube.com/watch?v=2svdeMGyw7A#t=33.764919
" cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
" cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

"normal mappings
"Toggle fold at current position
"(deprecated because it breaks the jumping list C-i command because C-i and tab are strictly equivalent)
" nnoremap <Tab> za

" Repeat last macro if in a normal buffer by hiting enter.
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

"Yank to end of line. (shift-D or shift-C applys to the end of the line. so shift-Y was missing)
noremap Y y$

" my custom pageups and pagedowns
nmap <leader>d LztM
nmap <leader>u HzbM

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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

"}}}

" Make search results appear on middle of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"----------Auto-Commands----------"

" Fix syntax highlight in vue files
autocmd FileType vue syntax sync fromstart

" Resize splits when the window is resized {{{
autocmd VimResized * :wincmd =
"}}}

autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

"Automatically source the .vimrc file on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
" au BufWritePost .vimrc so $MYVIMRC " auto loads .vimrc when saved http://mixandgo.com/blog/vim-config-for-rails-ninjas
augroup END

augroup volt-syntax
  autocmd!
  au BufReadPost *.volt set syntax=html
augroup END

"augroup vue-syntax
"  autocmd!
"  au BufReadPost *.vue set syntax=html
"augroup END
"
augroup hbs-syntax
  autocmd!
  au BufReadPost *.hbs set syntax=html
augroup END


" autocmd Filetype scss setlocal ts=4 sts=4 sw=4
 "expandtab is missing and it replaces tabs with spaces
augroup autoindenting
  autocmd!
  autocmd Filetype html setlocal ts=4 sts=4 sw=4
  autocmd Filetype volt setlocal ts=4 sts=4 sw=4
  autocmd Filetype php setlocal ts=4 sts=4 sw=4
  autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
  autocmd Filetype vue setlocal ts=4 sts=4 sw=4
augroup END
" ref: http://stackoverflow.com/questions/1562633/setting-vim-whitespace-preferences-by-filetype

" Enable seeing-is-believing mappings only for Ruby
" augroup seeingIsBelievingSettings
"   autocmd!
"   autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
"   autocmd FileType ruby xmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
"   autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
"   autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
"   autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)
"   autocmd FileType ruby nmap <buffer> <F6> <Plug>(seeing-is-believing-run)
"   autocmd FileType ruby imap <buffer> <F6> <Plug>(seeing-is-believing-run)
" augroup END



"----------Theme Options----------"

" Paper color theme options
set t_Co=256   " This is may or may not needed.
set background=light
"colorscheme PaperColor
colorscheme dracula

let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }
set noshowmode "hide --INSERT-- because lightline handles it

" https://github.com/r00k/dotfiles/blob/master/vimrc
"map <Leader>bb :!bundle install<cr>
"nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

"show hidden files like .rspec
let g:ctrlp_show_hidden = 1

"Mouse
" mouse enhanced also by the terminus plugin
set ttyfast " Send more characters for redraws
set mouse=a " Enable mouse use in all modes
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" folding settings http://smartic.us/2009/04/06/code-folding-in-vim/
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" set tags=./tags,tags "sets ctags

" fugitive Gstatus command
" nnoremap S :Gstatus<cr>

"http://bit.ly/2eOP2wL
" [buffer number] followed by filename:
set statusline=[%n]\ %t
" for Syntastic messages:
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" show line#:column# on the right hand side
set statusline+=%=%l:%c

" recomended settings for syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']

"vim-vue-syntastic configuration to make it work with local project eslint
" let g:syntastic_vue_checkers = ['eslint']
" let g:syntastic_scss_checkers = ['sass_lint']

let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
    let g:syntastic_vue_eslint_exec = local_eslint
endif

" use ag in ack.vim
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

" let g:ackprg = 'ag --vimgrep --smart-case'                                                   
" cnoreabbrev ag Ack                                                                           
" cnoreabbrev aG Ack                                                                           
" cnoreabbrev Ag Ack                                                                           
" cnoreabbrev AG Ack  

" The Silver Searcher https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" BufExplorer configuration
"nmap <script> <silent> <unique> <CR> :BufExplorer<CR>
" nmap <expr> <script> <silent> <unique> <CR> &buftype ==? '' ? ':BufExplorer<CR>' : '<CR>'
" let g:bufExplorerDisableDefaultKeyMapping=1
" let g:bufExplorerShowRelativePath=1
" let g:bufExplorerShowDirectories = 0

" rename current file https://github.com/r00k/dotfiles/blob/master/vimrc#L313
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

map <Leader>n :call RenameFile()<cr>

map <Leader>j <Plug>(easymotion-prefix)

autocmd VimEnter,Colorscheme * :hi Flashy guibg=#197bb7 ctermbg=252
let g:operator#flashy#flash_time = 240

" Breakline with Enter {{{
"nnoremap <CR> o<Esc>
"}}}
