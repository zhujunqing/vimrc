"set tabstop=4 

"set softtabstop=4 

"set shiftwidth=4

"set expandtab

"filetype plugin indent on

"设置自动添加头文件
" Auto add head info
" .py file into add header
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

"安装插件管理器Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" 在这里添加你想安装的Vim插件
Bundle 'gmarik/vundle'
" Python补全强力插件
Bundle 'davidhalter/jedi'
" c-family 补全插件
Bundle 'Valloric/YouCompleteMe'
" 添加引号,括号配对补全
Bundle 'jiangmiao/auto-pairs'
" 添加/解除注释
Bundle 'scrooloose/nerdcommenter'

call vundle#end()            " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

" 语法高亮
syntax on

" 设置配色
" colorscheme solarized  "可能需要提前下载

" 设置字体
set guifont=Monaco:h12

" 设置gvim启动窗口的位置，以及大小
" winpos 300 105
" set lines=30 columns=100

" 开启行号显示
set number

"下面两行在进行编写代码时，在格式对起上很有用；
"第一行，vim使用自动对起，也就是把当前行的对起格式应用到下一行；
"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编
"写上很有用
set autoindent
set smartindent

"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车
set incsearch

" 高亮当前行
set cursorline

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" 总是显示状态行
set laststatus=2

" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 在c,c++,python文件中用空格代替制表符
autocmd FileType c,cpp,python set shiftwidth=4 | set expandtab

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    " 如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,
        "\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: ZhuJunqing")
        call append(line(".")+2, "\# mail: zhujunqing9@163.com ")
        call append(line(".")+3, "\# Created Time: ".strftime("%F %R"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    endif
	if &filetype == 'java'
		call setline(1, "/**")
        call append(line("."), "* File Name: ".expand("%"))
        call append(line(".")+1, "* Author: zhujunqing")
        call append(line(".")+2, "* Mail: zhujunqing9@163.com ")
        call append(line(".")+3, "* Created Time: ".strftime("%F %R"))
        call append(line(".")+4, "*/")
        call append(line(".")+5, "")
	endif
    if &filetype == 'python'
        call append(line(".")+5, "\#!/usr/bin/env python")
        call append(line(".")+6, "\#coding: utf-8")
        call append(line(".")+7, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
endfunc 
" 新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
