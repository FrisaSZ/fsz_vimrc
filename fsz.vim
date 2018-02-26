" 自动下载插件管理器
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 修改保存配置文件后，让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 插件列表声明
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
call plug#end()


" 基本设置
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
set guioptions-=m
set guioptions-=T
" 始终显示状态栏
set laststatus=2
"set ruler
" 显示行号
set number
" 高亮当前行
set cursorline
" 高亮当前列
"set cursorcolumn
" 高亮搜索结果
set hlsearch
" 搜索时实时显示匹配结果
set incsearch
" 开启语法高亮
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 设置颜色主题
set background=dark
colorscheme onedark
" 设置leader键
let mapleader = ","
let g:mapleader = ","
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 设置字体
set guifont=Sarasa\ Mono\ SC:12
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 设置编码为utf8
set encoding=utf8


" nerdtree
" vim打开目录时自动打开nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 打开nerdtree
map <C-n> :NERDTreeToggle<CR>


" YouCompleteMe
" 强制重新编译和诊断代码
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <Leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:clang_library_path="/usr/local/lib/"
