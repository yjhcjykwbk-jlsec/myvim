"=========================================================================
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
"
" Last Change: 2010年08月02日 15时13分 
"
" Version:     1.80
"
"=========================================================================
source $VIMRUNTIME/mswin.vim
behave mswin

" 设置mapleader
let mapleader = ";"
let g:mapleader = ";"

set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
colorscheme aqua            " 设定配色方案
set number                  " 显示行号
set cursorline              " 突出显示当前行
set list                    " 显示制表符
set listchars=tab:\|\ ,	    " 显示Tab符，并且使用一高亮竖线代替
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"set listchars = tab:>-,trail:- 
"                           " 将制表符显示为'>---',将行尾空格显示为'-'
"set listchars=tab:./ ,trail:. " 将制表符显示为
set ruler                   " 打开状态栏标尺

set shiftwidth=2            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=2               " 设定 tab 长度为 4
set smarttab
set expandtab

set nobackup                " 覆盖文件时不备份
set autoread                " 当文件在外部被修改时，自动读取
set autochdir               " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes          " 设置备份时的行为为覆盖

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
"filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on   " 开启插件 智能补全
set completeopt=longest,menu " 关掉智能补全时的预览窗口

set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本

set nowrap                  " 不自动换行
set linebreak               " 整词换行

set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码

set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2             " 短暂跳转到匹配括号的时间
"
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set smartindent             " 开启新行时使用智能自动缩进
set noautoindent            " 关闭自动对齐
"set ai!                    "自动缩进
set backspace=indent,eol,start   "**
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
                            
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
                            " 设置在状态行显示的信息
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠 or marker
set foldmarker={,}          " if fold marker
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
" set foldclose=all           " 设置为自动关闭折叠                            
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠


" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

" 用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif

" 设定doc文档目录
let helptags=$VIMFILES.'/doc'

" 设置字体 以及中文支持
if has("win32")
    set guifont=Inconsolata:h12:cANSI
endif

" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif

    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"关于tab的快捷键
" map tn :tabnext<cr>
" map tp :tabprevious<cr>
" map td :tabnew .<cr>
" map te :tabedit
" map tc :tabclose<cr>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
"--------------------------------------------------------------
" 窗口操作的快捷键
"--------------------------------------------------------------
nmap wv     <C-w>v     " 垂直分割当前窗口
nmap wc     <C-w>c     " 关闭当前窗口
nmap ws     <C-w>s     " 水平分割当前窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nmap wk <C-w>k
nmap wj <C-w>j
nmap wl <C-w>l
nmap wh <C-w>h
"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
"尤其是智能补全要根据语言类型来做
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>

" set fileformats=unix,dos,mac
nmap <leader>fd :se fileformat=dos<CR>
nmap <leader>fu :se fileformat=unix<CR>

" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result
" map <C-x>l <ESC>:cl<CR>
" map <C-x>n <ESC>:cn<CR>
" map <C-x>p <ESC>:cp<CR>
" map <C-x>c <ESC>:cc<CR>


" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
" 设置字典 ~/.vim/dict/文件的路径
autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict
" 这个是pydiction-1.2插件
let g:pydiction_location = '$vimfiles/ftplugin/dict/complete-dict'
let g:pydiction_menu_height = 20

"-----------------------------------------------------------------
" plugin - winmanager bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
"-----------------------------------------------------------------
" plugin - winManager setting
"-----------------------------------------------------------------
let g:winManagerWindowLayout = "BufExplorer|FileExplorer"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
"nmap <C-w><C-f> :FirstExplorerWindow<cr>   " 切换到最上面一个窗格
"nmap <C-w><C-b> :BottomExplorerWindow<cr> " 切换到最下面一个窗格
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <F8> :WMToggle<cr>
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>
nmap wm :WMToggle<cr>    " 是nomal模式的命令，不是Ex模式的

"--------------------------------------------------------------
" WinManager :WMToggle
"--------------------------------------------------------------
"{
"}
"-----------------------------------------------------------------
" plugin - taglist.vim  查看函数列表，需要ctags程序
" F3 打开隐藏taglist窗口
"-----------------------------------------------------------------
if MySys() == "windows"                " 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
elseif MySys() == "linux"              " 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
nnoremap <silent><F3> :TlistToggle<CR>
"let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
"let Tlist_Use_SingleClick= 1         " 缺省情况下，在双击一个tag时，才会跳到该tag定义的位置
"let Tlist_Process_File_Always=1 "taglist始终解析文件中的tag，不管taglist窗口有没有打开
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close=1 "同时显示多个文件中的tag时，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_WinWidth = 25 " 40 cols wide
let NERDTreeWinSize= 23

"-----------------------------------------------------------------
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" \m  mark or unmark the word under (or before) the cursor
" \r  manually input a regular expression. 用于搜索.
" \n  clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" \*  当前MarkWord的下一个     \#  当前MarkWord的上一个
" \/  所有MarkWords的下一个    \?  所有MarkWords的上一个
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
"-----------------------------------------------------------------
" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>


"-----------------------------------------------------------------
" plugin - NERD_commenter.vim   注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ;cc注释
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看


"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释
"-----------------------------------------------------------------
let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /*  */<LEFT><LEFT><LEFT>


"-----------------------------------------------------------------
" plugin – ZenCoding.vim 很酷的插件，HTML代码生成
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin – checksyntax.vim    JavaScript常见语法错误检查
" 默认快捷方式为 F4
"-----------------------------------------------------------------
let g:checksyntax_auto = -1 " 不自动检查


"-----------------------------------------------------------------
" plugin - NeoComplCache.vim    自动补全插件
"-----------------------------------------------------------------
let g:AutoComplPop_NotEnableAtStartup = 1
let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'
let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" snippets expand key
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)


"-----------------------------------------------------------------
" plugin - matchit.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - vcscommand.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" SVN/git管理工具
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin – a.vim
"-----------------------------------------------------------------
"
"

"-----------------------------------------------------------------
"my options
"-----------------------------------------------------------------
" 一直启动鼠标
set mouse=a
" 快速重载配置文件
map <leader>s :source ~/.vimrc<cr> 
map <leader>e :e! ~/.vimrc<cr>
map <F3> :NERDTreeToggle<CR>
map <space><left> <esc>:NERDTree<CR> "regenerate NERDTree
map <F4> :Tlist<CR>
"map <space><right> <esc>:Tlist<CR>
map <F5> :!cmd &<CR>
map <tab><left> <ESC>:q!<return>
map <tab><right> <ESC>:w!<return>
map <tab><up> <ESC>:bp<RETURN>
map <tab><down> <ESC>:bn<RETURN>
map	<tab><pageup> <ESC>:bn<Bar>
			\bd # <Bar>
			\bp<RETURN>
map	<tab><pagedown> <ESC>:bp<Bar>
			\bd # <Bar>
			\bn<RETURN> 
map <SPACE><pagedown> <ESC>:w !sudo tee %<RETURN>
map <space><pageup> <ESC>:qa!<return>
map <space><up> <ESC>:!gnome-terminal &<cr><return>
map <space><down> <ESC>:!explorer . &<cr><return>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>
" 模仿MS Windows中的保存命令: Ctrl+S
vnoremap <C-C> "+y
"--------------------------------------------------------------
" QuickFix
"--------------------------------------------------------------
"{
nmap <F6> :cn<cr>   " 切换到下一个结果
nmap <F7> :cp<cr>   " 切换到上一个结果
"}
"--------------------------------------------------------------
" MiniBufExp
"--------------------------------------------------------------
"{
"let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"}
"--------------------------------------------------------------
" NERD_commenter
"--------------------------------------------------------------
let NERD_c_alt_style = 1    " 将C语言的注释符号改为//, 默认是/**/"
"--------------------------------------------------------------
" SuperTab :SuperTabHelp
"--------------------------------------------------------------
"{
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"--------------------------------------------------------------
" CVim :help csupport
"--------------------------------------------------------------
"{
let g:C_Comments = "no"         " 用C++的注释风格

let g:C_BraceOnNewLine = "no"   " '{'是否独自一行 '}'
let g:C_AuthorName = "Wu Yin"
let g:C_Project="F9"
let g:Cpp_Template_Function = "c-function-description-wuyin"
let g:C_TypeOfH = "c"           " *.h文件的文件类型是C还是C++
" if filetype is C
"   TODO
" fi
" }
"--------------------------------------------------------------
" 重新进行键盘映射，减少进入插入模式的方法
"--------------------------------------------------------------
"{
nmap c <esc>:<cr> 
nmap C <esc>:<cr> 
nmap I <esc>:<cr>  "原本是行首添加,可以用0i替代
nmap A <esc>:<cr>  "原本是行尾添加,可以用$a替代
nmap O <esc>:<cr>  "本是光标上面添加一行，可以用shift+o替代
nmap <S-j> <esc>:<cr> "shift+j=J，只用后者即可
nmap <S-k> <esc>:<cr> "shift+k不用
nmap H <esc>:<cr>
nmap K <esc>:<cr> 
nmap J <esc>:<cr> 
nmap L <esc>:<cr>
nmap r <esc>:<cr>  "不要替换模式
nmap s <esc>:<cr>  "不要替换模式
nmap R <esc>:<cr> 
nmap u <esc>:<cr>  “ctrl z代替u
nmap U <esc>:<cr>  “ctrl z代替u
nmap S <esc>:echo<cr>   
map  Q <Nop>
  "原本是删除行并且插入，可以用ddo或者dd<S-o>或者cc替代。现在用来向下翻页
nmap <F1> :<CR>
"}
"}
""--------------------------------------------------------------
"命令提示
"--------------------------------------------------------------
"mode{
":map 普通，可视模式及操作符等待模式
":vmap 可视模式
":omap 操作符等待模式
":map! 插入和命令行模式
":imap 插入模式
":cmap 命令行模式
"--------------------------------------------------------------
" 状态栏相关的设置
"--------------------------------------------------------------
"{
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 状态行显示的内容 [包括系统平台、文件类型、坐标、所占比例、时间等]
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %y%r%m%*%=\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}
set laststatus=2    " always show the status line
set ruler           " 在编辑过程中，在右下角显示光标位置的状态行
"}

"}
