"=========================================================================
" DesCRiption: �ʺ��Լ�ʹ�õ�vimrc�ļ���for Linux/Windows, GUI/Console
"
" Last Change: 2010��08��02�� 15ʱ13�� 
"
" Version:     1.80
"
"=========================================================================
source $VIMRUNTIME/mswin.vim
behave mswin

" ����mapleader
let mapleader = ";"
let g:mapleader = ";"

set nocompatible            " �ر� vi ����ģʽ
syntax on                   " �Զ��﷨����
colorscheme aqua            " �趨��ɫ����
set number                  " ��ʾ�к�
set cursorline              " ͻ����ʾ��ǰ��
set list                    " ��ʾ�Ʊ��
set listchars=tab:\|\ ,	    " ��ʾTab��������ʹ��һ�������ߴ���
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"set listchars = tab:>-,trail:- 
"                           " ���Ʊ����ʾΪ'>---',����β�ո���ʾΪ'-'
"set listchars=tab:./ ,trail:. " ���Ʊ����ʾΪ
set ruler                   " ��״̬�����

set shiftwidth=2            " �趨 << �� >> �����ƶ�ʱ�Ŀ��Ϊ 4
set softtabstop=4           " ʹ�ð��˸��ʱ����һ��ɾ�� 4 ���ո�
set tabstop=2               " �趨 tab ����Ϊ 4
set smarttab
set expandtab

set nobackup                " �����ļ�ʱ������
set autoread                " ���ļ����ⲿ���޸�ʱ���Զ���ȡ
set autochdir               " �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
set backupcopy=yes          " ���ñ���ʱ����ΪΪ����

syntax enable                " ���﷨����
syntax on                    " �����ļ��������
"filetype indent on           " ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype plugin on           " ��Բ�ͬ���ļ����ͼ��ض�Ӧ�Ĳ��
filetype plugin indent on   " ������� ���ܲ�ȫ
set completeopt=longest,menu " �ص����ܲ�ȫʱ��Ԥ������

set ignorecase smartcase    " ����ʱ���Դ�Сд��������һ�������ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
set nowrapscan              " ��ֹ���������ļ�����ʱ��������
set incsearch               " ������������ʱ����ʾ�������
set hlsearch                " ����ʱ������ʾ���ҵ����ı�

set nowrap                  " ���Զ�����
set linebreak               " ���ʻ���

set noerrorbells            " �رմ�����Ϣ����
set novisualbell            " �ر�ʹ�ÿ�������������
set t_vb=                   " �ÿմ����������ն˴���

set showmatch               " ��������ʱ�����ݵ���ת��ƥ��Ķ�Ӧ����
" set matchtime=2             " ������ת��ƥ�����ŵ�ʱ��
"
set magic                   " ����ħ��
set hidden                  " ��������δ������޸�ʱ�л�����������ʱ���޸��� vim ���𱣴�
set guioptions-=T           " ���ع�����
set guioptions-=m           " ���ز˵���
"set smartindent             " ��������ʱʹ�������Զ�����
set noautoindent            " �ر��Զ�����
"set ai!                    "�Զ�����
set backspace=indent,eol,start   "**
                            " ���趨�ڲ���״̬�޷����˸���� Delete ��ɾ���س���
                            
set cmdheight=1             " �趨�����е�����Ϊ 1
set laststatus=2            " ��ʾ״̬�� (Ĭ��ֵΪ 1, �޷���ʾ״̬��)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
                            " ������״̬����ʾ����Ϣ
set foldenable              " ��ʼ�۵�
set foldmethod=marker       " �����﷨�۵�syntax or marker
set foldmarker={,}          " if fold marker
set foldcolumn=0            " �����۵�����Ŀ��
setlocal foldlevel=1        " �����۵�����Ϊ
" set foldclose=all           " ����Ϊ�Զ��ر��۵�                            
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " �ÿո���������۵�


" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

" �û�Ŀ¼����$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif

" �趨doc�ĵ�Ŀ¼
let helptags=$VIMFILES.'/doc'

" �������� �Լ�����֧��
if has("win32")
    set guifont=Inconsolata:h12:cANSI
endif

" ���ö����Ի���
if has("multi_byte")
    " UTF-8 ����
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

" Buffers������ݷ�ʽ!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab������ݷ�ʽ!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"����tab�Ŀ�ݼ�
" map tn :tabnext<cr>
" map tp :tabprevious<cr>
" map td :tabnew .<cr>
" map te :tabedit
" map tc :tabclose<cr>

"���ڷָ�ʱ,�����л��İ����ȼ���Ҫ��������,������·������ƶ�
"��굽�Ϸ�����,��Ҫ<c-w><c-w>k,�ǳ��鷳,������ӳ��Ϊ<c-k>,�л���
"ʱ����÷ǳ�����.
"--------------------------------------------------------------
" ���ڲ����Ŀ�ݼ�
"--------------------------------------------------------------
nmap wv     <C-w>v     " ��ֱ�ָǰ����
nmap wc     <C-w>c     " �رյ�ǰ����
nmap ws     <C-w>s     " ˮƽ�ָǰ����
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nmap wk <C-w>k
nmap wj <C-w>j
nmap wl <C-w>l
nmap wh <C-w>h
"һЩ�����ӳ��ת���﷨�������һ���ļ��л���˲�ͬ����ʱ���ã�
"���������ܲ�ȫҪ����������������
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


" �� Tohtml ������ CSS �﷨�� html
" syntax/2html.vim��������:runtime! syntax/2html.vim
let html_use_css=1

" Python �ļ���һ�����ã����粻Ҫ tab ��
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>

" ѡ��״̬�� Ctrl+c ����
vmap <C-c> "+y

" ��javascript�۵�
let b:javascript_fold=1
" ��javascript��dom��html��css��֧��
let javascript_enable_domhtmlcss=1
" �����ֵ� ~/.vim/dict/�ļ���·��
autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict
" �����pydiction-1.2���
let g:pydiction_location = '$vimfiles/ftplugin/dict/complete-dict'
let g:pydiction_menu_height = 20

"-----------------------------------------------------------------
" plugin - winmanager bufexplorer.vim Buffers�л�
" \be ȫ����ʽ�鿴ȫ���򿪵��ļ��б�
" \bv ���ҷ�ʽ�鿴   \bs ���·�ʽ�鿴
"-----------------------------------------------------------------
" plugin - winManager setting
"-----------------------------------------------------------------
""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = "BufExplorer|TagList"
let g:winManagerWindowLayout = "TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 1
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr> 
"���ý���ָ�  
"nmap <C-w><C-f> :FirstExplorerWindow<cr>   " �л���������һ������
"nmap <C-w><C-b> :BottomExplorerWindow<cr> " �л���������һ������
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>
nmap wm :WMToggle<cr>    " ��nomalģʽ���������Exģʽ��

"--------------------------------------------------------------
" WinManager :WMToggle
"--------------------------------------------------------------
"{
"}
"-----------------------------------------------------------------
" plugin - taglist.vim  �鿴�����б���Ҫctags����
" F4 ������taglist����
"-----------------------------------------------------------------
if MySys() == "windows"                " �趨windowsϵͳ��ctags�����λ��
    let Tlist_Ctags_Cmd = '"'.$V9MRUNTIME.'/ctags.exe"'
elseif MySys() == "linux"              " �趨windowsϵͳ��ctags�����λ��
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
"let Tlist_Show_One_File = 1            " ��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow = 1          " ���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1         " ���Ҳര������ʾtaglist����
let Tlist_File_Fold_Auto_Close=1       " �Զ��۵���ǰ�Ǳ༭�ļ��ķ����б�
let Tlist_Use_SingleClick= 1         " ȱʡ����£���˫��һ��tagʱ���Ż�������tag�����λ��
"let Tlist_Process_File_Always=1 "taglistʼ�ս����ļ��е�tag������taglist������û�д�
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
"let Tlist_Display_Prototype = 0
"let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close=1 "ͬʱ��ʾ����ļ��е�tagʱ����ʹtaglistֻ��ʾ��ǰ�ļ�tag�������ļ���tag�����۵�������
let Tlist_Show_Menu=1
"let Tlist_WinWidth = 23 " 40 cols wide
let NERDTreeWinSize= 30

"-----------------------------------------------------------------
" plugin - mark.vim ������tags��ǲ�ͬ����ɫ�����ڹۿ���ʽ�Ĳ����
" \m  mark or unmark the word under (or before) the cursor
" \r  manually input a regular expression. ��������.
" \n  clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" \*  ��ǰMarkWord����һ��     \#  ��ǰMarkWord����һ��
" \/  ����MarkWords����һ��    \?  ����MarkWords����һ��
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - NERD_tree.vim ����״��ʽ���ϵͳ�е��ļ���Ŀ¼
" :ERDtree ��NERD_tree         :NERDtreeClose    �ر�NERD_tree
" o �򿪹ر��ļ�����Ŀ¼         t �ڱ�ǩҳ�д�
" T �ں�̨��ǩҳ�д�           ! ִ�д��ļ�
" p ���ϲ�Ŀ¼                   P ����Ŀ¼
" K ����һ���ڵ�                 J �����һ���ڵ�
" u ���ϲ�Ŀ¼                 m ��ʾ�ļ�ϵͳ�˵�����ӡ�ɾ�����ƶ�������
" r �ݹ�ˢ�µ�ǰĿ¼             R �ݹ�ˢ�µ�ǰ��Ŀ¼
"-----------------------------------------------------------------
" F3 NERDTree/winmanager �л�
"map <F3> :NERDTreeToggle<CR>
"imap <F3> <ESC>:NERDTreeToggle<CR>
map	<F3> :NERDTreeToggle<BAR>WMToggle <CR>
map	<F2> :colorscheme autumnleaf <CR>
map	<F4> :colorscheme blacksea <CR>
map	<F9> :colorscheme baycomb <CR>


"-----------------------------------------------------------------
" plugin - NERD_commenter.vim   ע�ʹ����õģ�
" [count],cc �������count���������ע��(7,cc)
" [count],cu �������count������ȡ��ע��(7,cu)
" [count],cm �������count�г�����ӿ�ע��(7,cm)
" ;ccע��
" ,cA ����β���� /* */,���ҽ������ģʽ�� ��������дע�͡�
" ע��count������ѡ������Ĭ��Ϊѡ���л�ǰ��
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " ��ע�ͷ������֮����һ���ո�
let NERDCompactSexyComs=1   " ����ע��ʱ���Ӹ��ÿ�


"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim  ��ע�������ĵ��������ܹ��������ɺ�����׼ע��
"-----------------------------------------------------------------
let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /*  */<LEFT><LEFT><LEFT>


"-----------------------------------------------------------------
" plugin �C ZenCoding.vim �ܿ�Ĳ����HTML��������
" ������°棺http://github.com/mattn/zencoding-vim
" ��������ɿ���http://nootn.com/blog/Tool/23/
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin �C checksyntax.vim    JavaScript�����﷨������
" Ĭ�Ͽ�ݷ�ʽΪ F4
"-----------------------------------------------------------------
let g:checksyntax_auto = -1 " ���Զ����


"-----------------------------------------------------------------
" plugin - NeoComplCache.vim    �Զ���ȫ���
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
" plugin - matchit.vim   ��%���������չʹ������Ƕ�ױ�ǩ�����֮����ת
" % ����ƥ��      g% ����ƥ��
" [% ��λ����     ]% ��λ��β
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - vcscommand.vim   ��%���������չʹ������Ƕ�ױ�ǩ�����֮����ת
" SVN/git������
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin �C a.vim
"-----------------------------------------------------------------
"
"

"-----------------------------------------------------------------
"my options
"-----------------------------------------------------------------
" һֱ�������
set mouse=a
" �������������ļ�
map <leader>s :source ~/.vimrc<cr> 
map <leader>e :e! ~/.vimrc<cr>
map <space><left> <esc>:NERDTreeToggle<CR>
map <space><right> <esc>:Tlist<CR>
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
" ģ��MS Windows�еı�������: Ctrl+S
vnoremap <C-C> "+y
"--------------------------------------------------------------
" QuickFix
"--------------------------------------------------------------
"{
nmap <F6> :cn<cr>   " �л�����һ�����
nmap <F7> :cp<cr>   " �л�����һ�����
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
let NERD_c_alt_style = 1    " ��C���Ե�ע�ͷ��Ÿ�Ϊ//, Ĭ����/**/"
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
let g:C_Comments = "no"         " ��C++��ע�ͷ��

let g:C_BraceOnNewLine = "no"   " '{'�Ƿ����һ�� '}'
let g:C_AuthorName = "Wu Yin"
let g:C_Project="F9"
let g:Cpp_Template_Function = "c-function-description-wuyin"
let g:C_TypeOfH = "c"           " *.h�ļ����ļ�������C����C++
" if filetype is C
"   TODO
" fi
" }
"--------------------------------------------------------------
" ���½��м���ӳ�䣬���ٽ������ģʽ�ķ���
"--------------------------------------------------------------
"{
nmap c <esc>:<cr> 
nmap C <esc>:<cr> 
nmap I <esc>:<cr>  "ԭ�����������,������0i���
nmap A <esc>:<cr>  "ԭ������β���,������$a���
nmap O <esc>:<cr>  "���ǹ���������һ�У�������shift+o���
nmap <S-j> <esc>:<cr> "shift+j=J��ֻ�ú��߼���
nmap <S-k> <esc>:<cr> "shift+k����
"nmap H <esc>:<cr>
nmap K <esc>:<cr> 
nmap J <esc>:<cr> 
"nmap L <esc>:<cr>
nmap r <esc>:<cr>  "��Ҫ�滻ģʽ
nmap s <esc>:<cr>  "��Ҫ�滻ģʽ
nmap R <esc>:<cr> 
nmap u <esc>:<cr>  ��ctrl z����u
nmap U <esc>:<cr>  ��ctrl z����u
nmap S <esc>:echo<cr>   
map  Q <Nop>    
"ԭ����ɾ���в��Ҳ��룬������ddo����dd<S-o>����cc����������������·�ҳ
nmap <F1> :<CR>
"}
"}
""--------------------------------------------------------------
"������ʾ
"--------------------------------------------------------------
"mode{
":map ��ͨ������ģʽ���������ȴ�ģʽ
":vmap ����ģʽ
":omap �������ȴ�ģʽ
":map! �����������ģʽ
":imap ����ģʽ
":cmap ������ģʽ
"--------------------------------------------------------------
" ״̬����ص�����
"--------------------------------------------------------------
"{
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" ״̬����ʾ������ [����ϵͳƽ̨���ļ����͡����ꡢ��ռ������ʱ���]
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %y%r%m%*%=\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}
set laststatus=2    " always show the status line
set ruler           " �ڱ༭�����У������½���ʾ���λ�õ�״̬��
"}

"}
