"Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' "Let Vundle manage Vundle, required
Plugin 'wincent/terminus'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-endwise' "End certain structures in ruby
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'mattn/emmet-vim'
Plugin 'hwartig/vim-seeing-is-believing'
Plugin 'scrooloose/syntastic'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'tpope/vim-vinegar'
"Plugin 'etaoins/vim-volt-syntax'

Plugin 'posva/vim-vue'
Plugin 'sekel/vim-vue-syntastic'
" Plugin 'tpope/vim-bundler'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'jlanzarotta/bufexplorer'

Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'vim-scripts/tlib'

" getting used to (in progress muscle memory)
Plugin 'tpope/vim-obsession' " save vim session
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tommcdo/vim-lion'
Plugin 'AndrewRadev/splitjoin.vim'

" vim-repeat: make vim-commentary and vim-surround work with .
Plugin 'tpope/vim-repeat'

Plugin 'vim-scripts/LustyJuggler'
Plugin 'moll/vim-node'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'

" themes
Plugin 'bluz71/vim-moonfly-colors'
Plugin 'dracula/vim'

" text objects
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line' " al, il 

Plugin 'kana/vim-niceblock' 

" Search
Plugin 'osyo-manga/vim-over' "substitue preview
Plugin 'Shougo/denite.nvim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'

Plugin 'kana/vim-operator-user'
Plugin 'haya14busa/vim-operator-flashy'

Plugin 'vim-scripts/YankRing.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'henrik/vim-indexed-search'

"Plugin 'Valloric/YouCompleteMe'
Plugin 'rhysd/clever-f.vim'

"ui
Plugin 'itchyny/lightline.vim'

Plugin 'pangloss/vim-javascript'

"extends and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers
Plugin 'junegunn/vim-peekaboo' 
Plugin 'thinca/vim-qfreplace'



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

