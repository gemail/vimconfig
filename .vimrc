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
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin('~/.vim/bundle/')

" 插件管理插件。
" 所有插件在Filetype之间添加。可以是以下三种形式：
" vim.org上的脚本名                 Plugin php
" Plugin github上的作者/项目名称    Plugin gmark/vundle
" Plugin 一个完整的Git路径          Plugin git://git.wincent.com/commit.git
" Vundle常用指令
" :PluginList                       列出已经安装的插件
" :PluginInstall                    安装所有配置文件中的插件
" :PluginInstall!                   更新所有插件
" :PluginSearch                     搜索插件
" :PluginClean!                     根据配置文件删除插件
Plugin 'gmarik/Vundle.vim'

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
let g:go_highlight_build_constraints = 1

Plugin 'jsbeautify'

" 代码片段，需要python支持
"Plugin 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-k>"
"let g:UltiSnipsJumpBackwardTrigger="<c-j>"
"let g:UltiSnipsSnippetDirectories=["ultisnippets"]

" YCM插件。 windows安装麻烦，而且如果有msvcr90.dll的话，还有冲突
Plugin 'Valloric/YouCompleteMe'

" 多光标支持。
Plugin 'terryma/vim-multiple-cursors'

" 快速注释
Plugin 'scrooloose/nerdcommenter'
Plugin 'xml.vim'
Plugin 'fatih/molokai'

" airline 状态栏美化。
Plugin 'bling/vim-airline'

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : '标准',
      \ 'i'  : '插入',
      \ 'R'  : '替换',
      \ 'c'  : '命令行',
      \ 'v'  : '可视',
      \ 'V'  : '可视',
      \ '' : '可视',
      \ 's'  : '选择',
      \ 'S'  : '选择',
      \ '' : '选择',
      \ }

set laststatus=2

" airline-tabline扩展设计，若需要更专业的buffer列表显示插件，
" 可以使用 techlivezheng/vim-plugin-minibufexpl 插件！
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnamemod = ':p:t' " 只显示文件名，不显示路径内容。

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
" 映射代码实例的快捷键
imap <C-u> <C-x><C-o>
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
map <leader>gr      :GoReferrers<CR>
map <leader>gm      :GoRename<CR>

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

nnoremap <Leader>gf :GoFmt<CR>
nnoremap <Leader>gi :GoImports<CR>
nnoremap <Leader>gc :GoCallers<CR>

:colorscheme molokai

" 弹出框样式，比如自动补全的下拉框。
hi Pmenu    guibg=darkgrey  guifg=black
hi PmenuSel guibg=lightgrey guifg=black
hi CursorColumn term=none cterm=none ctermbg=232
hi Search term=reverse cterm=reverse ctermfg=58 ctermbg=118 gui=reverse guifg=#C4BE89 guibg=#000000
