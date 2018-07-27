"Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'Leafcage/foldCC'
"Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'hwartig/vim-seeing-is-believing'
" Plugin 'AndrewRadev/splitjoin.vim'
"Plugin 'vim-ruby/vim-ruby'
"
Plugin 'VundleVim/Vundle.vim' "Let Vundle manage Vundle, required

Plugin 'wincent/terminus'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'posva/vim-vue'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'vim-scripts/tlib'
Plugin 'tpope/vim-obsession' " save vim session
Plugin 'tommcdo/vim-lion'
Plugin 'tpope/vim-repeat' "  make vim-commentary and vim-surround work with .
" Plugin 'vim-scripts/LustyJuggler'
Plugin 'moll/vim-node'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Yggdroot/indentLine' "display indentation line

Plugin 'haya14busa/incsearch.vim'
"Plugin 'haya14busa/incsearch-fuzzy.vim'

" themes
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'bluz71/vim-moonfly-colors'
Plugin 'dracula/vim'
Plugin 'tomasiser/vim-code-dark'

" text objects
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line' " al, il 
Plugin 'wellle/targets.vim'
Plugin 'kana/vim-textobj-function'
Plugin 'thinca/vim-textobj-function-javascript'
Plugin 'rhysd/vim-textobj-anyblock'
Plugin 'kana/vim-niceblock' 

" Search
" Plugin 'Shougo/vimproc.vim'
" Plugin 'osyo-manga/vim-over' "substitue preview (review because it was not working)
" Plugin 'Shougo/denite.nvim'
" Plugin 'Shougo/unite.vim'
" Plugin 'Shougo/neomru.vim' 

Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kana/vim-operator-user'
Plugin 'haya14busa/vim-operator-flashy'
Plugin 'haya14busa/vim-edgemotion'
Plugin 'LeafCage/yankround.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rhysd/clever-f.vim'

"ui
Plugin 'itchyny/lightline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'Shougo/context_filetype.vim'
Plugin 'tyru/caw.vim'
"extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers
"Plugin 'junegunn/vim-peekaboo' 
"Plugin 'thinca/vim-qfreplace'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'cohama/lexima.vim' "auto close parenthesis

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

