if exists("g:loaded_vimrc")
    finish
endif
let g:loaded_vimrc=1

set nocompatible

"language messages en_US.UTF-8

"set runtimepath+=/usr/share/vim-scripts

" charset detect list. ucs-bom must be earlier than ucs*.
"set fileencodings=ucs-bom,UTF-8,euc-jp,euc-kr,big5,cp936,latin1
set fileencodings=ucs-bom,UTF-8,cp936,latin1
set fileencoding=UTF-8
set encoding=UTF-8
set termencoding=UTF-8

set fileformats=unix,dos
set fileformat=unix

set browsedir=buffer autochdir gdefault
set nobackup history=80 "backupdir=~/.vim/bak
set undofile undodir=~/.cache/vim.undo undolevels=1000
set ruler showcmd title titlelen=70 icon wrap showmatch number numberwidth=4 "list
"set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set ttyfast nolazyredraw ttymouse=xterm2 nomousefocus mouse=
set autoindent digraph esckeys hidden expandtab startofline smartindent
set laststatus=1 whichwrap=<,> tabstop=8 shiftwidth=4 softtabstop=4 smarttab
set comments=s1:/*,mb:*,ex:*/,://,b:# syntax=ON
set viminfo=%,'50,f1,\"50,:50,<1000
set listchars=tab:>-,trail:.,extends:>
set noconfirm iskeyword+=_,$,@,%,#,-
set pastetoggle=<F2> shortmess+=I nomore modelines=5 hlsearch! incsearch
set backspace=indent,eol,start nodigraph nopaste
set ambiwidth=double "linebreak textwidth=78
set formatoptions+=cqrtmB keymodel=
"set lines=24 columns=80
set nospell spelllang=en_us
set linespace=0 wildmenu report=0
set nocursorline nocursorcolumn
set noerrorbells novisualbell
set formatoptions=tcrqn
set ttimeoutlen=100

syntax on

if has("gui_running")
    set guifont=Menlo\ Regular:h14
    set guioptions=ctgm
    set langmenu=zh_CN.UTF-8
endif

"if has('multi_byte_ime')
"    " 关闭Vim的自动切换IME输入法(插入模式和检索模式)
"    "set iminsert=0 imsearch=0
"    " 插入模式输入法状态未被记录时，默认关闭IME
"    "inoremap <silent> <ESC> <ESC>:set iminsert=2<CR>
"
"    " 未开启IME时光标背景色
"    "highlight Cursor guifg=bg guibg=Orange gui=NONE
"    " 开启IME时光标背景色
"    "highlight CursorIM guifg=NONE guibg=Skyblue gui=NONE
"    "set imactivatekey=C-space
"    "autocmd InsertEnter * set noimdisable
"    "autocmd InsertLeave * set imdisable
"    "autocmd CmdWinEnter * inoremap <buffer> <Esc> <C-o>:exit<CR><Esc> 
"                \ | set noimdisable | set insertmode
"    "autocmd CmdWinLeave * set imdisable | set noinsertmode
"    "cnoremap <C-space> <C-f> 
"endif

" color
colorscheme torte
set completeopt=menu pumheight=10
highlight Normal cterm=NONE ctermbg=NONE
"highlight CursorLine cterm=NONE cterm=reverse
highlight CursorLine cterm=NONE ctermbg=darkmagenta
highlight CursorColumn cterm=NONE ctermbg=darkmagenta
highlight LineNr cterm=NONE ctermbg=black ctermfg=brown
highlight Pmenu cterm=NONE ctermbg=black ctermfg=gray
highlight PmenuSel cterm=NONE ctermbg=white ctermfg=black
highlight PmenuSbar cterm=NONE ctermbg=white
highlight PmenuThumb ctermbg=NONE ctermbg=magenta ctermfg=white
highlight OverLength ctermbg=NONE ctermbg=lightred ctermfg=white
"match OverLength '\%101v.*'

" Key binding
nno <F1> :set hls!<bar>set hls?<CR>
ino <F1> <C-O>:set hls!<bar>set hls?<CR>
nno <F3> :set nu!<bar>set nu?<CR>
ino <F3> <C-O>:set nu!<bar>set nu?<CR>
nno <F4> :set spell!<bar>set spell?<CR>
ino <F4> <C-O>:set spell!<bar>set spell?<CR>
nno <F5> :set cursorline!<bar>set cursorline?<CR>
ino <F5> <C-O>:set cursorline!<bar>set cursorline?<CR>
nno <F6> :set cursorcolumn!<bar>set cursorcolumn?<CR>
ino <F6> <C-O>:set cursorcolumn!<bar>set cursorcolumn?<CR>
nno <Down> gj
ino <Down> <C-O>gj
nno <Up> gk
ino <Up> <C-O>gk

filetype plugin indent on
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

autocmd WinLeave * let &titleold = $USER . "@" . hostname() . ":" . getcwd()
autocmd BufEnter * let &titlestring = $USER . "@" . hostname() . ":" . expand("%:p") . "%m"
autocmd BufEnter *.html,*.htm,*.xml setlocal matchpairs+=<:>
autocmd BufNewFile *.sh call setline(1, "#!/bin/bash") | exe "normal 2o"

" vimwiki
let mywiki = {}
let mywiki.nested_syntaxes = {
            \ 'cpp':    'cpp',
            \ 'python': 'python',
            \ 'perl':   'perl',
            \ 'php':    'php',
            \ 'sql':    'sql',
            \ 'bash':   'sh',
            \ 'text':   'text',
            \ 'html':   'html',
            \ 'xhtml':  'xhtml',
            \ 'css':    'css',
            \ 'js':     'javascript',
            \ 'xml':    'xml',
            \ 'diff':   'diff',
            \ 'ini':    'dosini',
            \ 'conf':   'conf',
            \ 'lua':    'lua',
            \ }
let mywiki.path = '~/Documents/wiki/'
let mywiki.path_html = '~/Documents/wiki/html/'
let mywiki.template_path = '~/Documents/wiki/template/'
let mywiki.template_default = 'mytemplate'
let mywiki.template_ext = '.tpl'
let mywiki.auto_export = 1
let mywiki.syntax = 'default'
let g:vimwiki_list = [mywiki]
let g:vimwiki_valid_html_tags = 'br, wbr, footer'
let g:vimwiki_file_exts = 'c, cpp, wav, txt, h, hpp, zip, sh, pl, py, java, awk, ps, pdf'
let g:vimwiki_user_htmls = '404.html, search.html'
let g:vimwiki_folding = 'expr'
let g:vimwiki_global_ext = 0
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_menu = ''
let g:vimwiki_use_mouse = 0
let g:vimwiki_list_ignore_newline = 0
let g:vimwiki_html_header_numbering = 2
let g:vimwiki_html_header_numbering_sym = '.'
let g:vimwiki_autowriteall = 0
let g:vimwiki_url_maxsave = 10
let g:vimwiki_use_calendar = 1
let g:vimwiki_debug = 0

autocmd BufNewFile *.wiki
            \ let lm = '%% Last Modified: ' . strftime("%Y/%m/%d %H:%M:%S") |
            \ call setline(1, '%% vim:nofoldenable:') |
            \ call setline(2, lm) |
            \ call setline(3, '') |
            \ call setline(4, '%% 文档版本') |
            \ call setline(5, '%% |版本|日期      |描述|') |
            \ call setline(6, '%% |----|----------|----|') |
            \ call setline(7, '%% |0.1 |' . strftime("%Y-%m-%d") . '|init|') |
            \ call setline(8, '') |
            \ call setline(9, '%toc') |
            \ call setline(10, '') |
            \ call setline(11, '= ' . expand('%:t:r') . ' =') |
            \ exe "$" | exe "normal 2o"

autocmd BufEnter *.wiki inoremap <buffer> <F8> {{{<CR>}}}<C-O>k<C-O>Aclass="brush: text; title: '';"<CR>

if exists("&cryptmethod")
    set cryptmethod=blowfish
endif

"autocmd BufReadPre *.pass if system("head -c 9 " . expand("<afile>")) == "VimCrypt~" | call SetupEncryption() | endif
"function SetupEncryption()
"  setlocal nobackup nowritebackup noswapfile bufhidden=wipe autoindent ignorecase viminfo=""
"  setlocal foldenable foldmethod=indent foldopen=search,hor foldclose=all foldlevel=0
"
"  " move cursor over word and press 'e' to obfuscate/unobfuscate it
"  "noremap e g?iw
"
"  inoremap <buffer> <F8> <CR>    描述: <CR>端口: <CR>帐号<CR><CR><C-O>5k<C-O>I
"endfunction

autocmd BufWrite *.wiki
            \ let lm = '%% Last Modified: ' . strftime("%Y/%m/%d %H:%M:%S") |
            \ if getline(2) =~ "Last Modified: " |
            \     silent! call setline(2, lm) | endif

iab idate <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>

"nmap <leader>tt <Plug>VimwikiToggleListItem

" Calendar
let g:calendar_navi_label = '<,今天,>'
let g:calendar_mruler = '01月,02月,03月,04月,05月,06月,07月,08月,09月,10月,11月,12月'
let g:calendar_wruler = '日 一 二 三 四 五 六'
let g:calendar_mark = 'right'
let g:calendar_navi = 'bottom'
