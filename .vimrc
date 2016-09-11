" 设置不兼容VI模式，在增强模式下运行
set nocompatible

" 覆盖文件时不备份
set nobackup
" 不启用交换文件
set noswapfile
set nowritebackup
set shiftwidth=4
set softtabstop=4
set smarttab

" 保存文件格式
set fileformats=unix,dos
" 读文件时，使用的编码。前2个顺序不能错
set fileencodings=ucs-bom,utf-8,cp936,gb2312,gb18030,gbk
" 保存时，使用的编码
set fileencoding=utf-8
" 程序使用的编码
set encoding=utf-8
" 终端上使用的编码
set termencoding=utf-8

let $LANG='zh_CN.UTF-8'
" 菜单语言，必须要在 set encoding之后,界面加载之前
set langmenu=zh_CN.utf-8
" 自动隐藏鼠标
set mousehide
" 右键点击时，弹出菜单
set mousemodel=popup
" 不显示菜单栏
set guioptions-=m
" 不显示工具栏
set guioptions-=T
" r代表right，就是在右侧显示滚动条
set guioptions-=r
set guioptions-=L
" b代表bottom，就是不在下面加入滚动条
set guioptions-=b
" 高亮显示当前行
set cursorline
set cursorcolumn
" 显示行号
set nu
" 搜索时高亮关键字
set hlsearch
" 搜索时逐字高亮
set incsearch
" 命令行按tab补全时，显示一个候选菜单
set wildmenu
" 右下角显示光标状态的行
set ruler
" 左下角显示当前的模式
set showmode
" 显示当前输入的命令
set showcmd

" 为C程序提供自动缩进
set smartindent
set cindent
" 使用space代替tab.
set expandtab
set backspace=indent,eol,start
set tabstop=4

"==============================================================================
"========================== start Vundle
"==============================================================================
filetype off

" 此处规定Vundle的路径
set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" CSS颜色值背景显示定义的颜色
Plugin 'ap/vim-css-color'

" html5高亮
Plugin 'othree/html5.vim'
"
" JS高亮及HTML/JS混排缩进改善
Plugin 'pangloss/vim-javascript'

Plugin 'xptemplate'

" 侧边树状文件夹浏览
Plugin 'scrooloose/nerdtree'

Plugin 'python.vim'

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.\.obj$', '.\.o$', '.\.so$', '.\.exe$', '.\.git$', '.\.swp$']
" 在nerdtree窗口中禁用BD命令。
autocmd FileType nerdtree cnoreabbrev <buffer> bd <nop>
let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDTreeDirArrows=1 "目录箭头 1 显示箭头  0传统+-|号

" 侧边栏显示相关函数定义等，依赖http://ctags.sourceforge.net/
Plugin 'majutsushi/tagbar'
let g:tagbar_width = 30
let g:tagbar_left =0

" golang相关插件
Plugin 'fatih/vim-go'
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"

Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1

Plugin 'jsbeautify'

" 多光标支持。
Plugin 'terryma/vim-multiple-cursors'

" 快速注释
Plugin 'scrooloose/nerdcommenter'
Plugin 'xml.vim'
Plugin 'fatih/molokai'

" airline 状态栏美化。
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 239

set laststatus=2

let g:pydiction_location = '/path/to/complete-dict'
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call vundle#end()

filetype indent on
filetype plugin on
"==============================================================================
"======================== end Bundle
"==============================================================================

" 自动开启语法高亮
syn on
set completeopt-=preview
map <C-h> :NERDTreeToggle<CR>
nmap <F1> :TagbarToggle<CR>

function MMK()
    call append(line("."), "/*")
    call append(line(".")+1, " |    Function:")
    call append(line(".")+2, " |      Author: Mr.Sancho")
    call append(line(".")+3, " |        Date: ".strftime("%Y-%m-%d"))
    call append(line(".")+4, " | Description:")
    call append(line(".")+5, " |      Return:")
    call append(line(".")+6, " |")
    call append(line(".")+7, " */")
endf

function BMK()
    call append(line("."), "/*")
    call append(line(".")+1, " *")
    call append(line(".")+2, " *")
    call append(line(".")+3, " */")
endf

"   格式化xml
function Xmlfmt()
    set filetype=xml
    :%s/\r//g
    :%s/>\s*</>\r</g "把><替换成>回车<
    :normal gg=G
endfunction

"   格式化html
function Htmlfmt()
    set filetype=html
    :%s/\r//g
    :%s/>\s*</>\r</g "把><替换成>回车<
    :normal gg=G
endfunction

let mapleader=";"

map <leader>xml     :call Xmlfmt()<CR>
map <leader>html    :call Htmlfmt()<CR>
map <leader>mmk     :call MMK()<CR>
map <leader>bmk     :call BMK()<CR>
nnoremap <Leader>gf :GoFmt<CR>
nnoremap <Leader>gd <C-]>
nnoremap <Leader>tn :tnext<CR>
nnoremap <Leader>tp :tprevious<CR>
nnoremap <Leader>gc :GoCallers<CR>
nnoremap <leader>gr :GoReferrers<CR>
nnoremap <leader>gm :GoRename<CR>
nnoremap <leader>gu :GoInfo<CR>
nnoremap <leader>gl :GoLint<CR>
nnoremap <leader>gb :GoBuild<CR>

" 定义快捷键到行首和行尾
nmap <Leader>lb 0
nmap <Leader>le $

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>s :w<CR>
nmap <Leader>wq :wq<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 跳转至右方的窗口
nnoremap <Leader>wl <C-W>l
" 跳转至方的窗口
nnoremap <Leader>wh <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>wk <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>wj <C-W>j

colorscheme molokai

" 弹出框样式，比如自动补全的下拉框。
hi Pmenu    guibg=darkgrey  guifg=black
hi PmenuSel guibg=lightgrey guifg=black
hi CursorColumn ctermbg=16 guibg=black
hi CursorLine ctermbg=16 guibg=black
hi Search term=reverse cterm=reverse ctermfg=58 ctermbg=118 gui=reverse guifg=#C4BE89 guibg=#000000
set tags+=~/.vim/tags/python.tags
set tags+=tags;/
