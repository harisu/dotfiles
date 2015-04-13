"=============================================================================
"    Description: .vimrc
"         Author: km
"  Last Modified: 2013-10-10 00:00
"        Version: 0.20
"=============================================================================
set nocompatible
"scriptencoding cp932
scriptencoding utf-8
"scriptencodingと、このファイルのエンコーディングが一致するよう注意！
"scriptencodingは、vimの内部エンコーディングと同じものを推奨します。
"改行コードは set fileformat=unix に設定するとunixでも使えます。
set encoding=utf-8

"----------------------------------------
" ユーザーランタイムパス設定
"----------------------------------------
"Windows, unixでのruntimepathの違いを吸収するためのもの。
"$MY_VIMRUNTIMEはユーザーランタイムディレクトリを示す。
":echo $MY_VIMRUNTIMEで実際のパスを確認できます。
if isdirectory($HOME . '/.vim')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
  let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
  let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

"ランタイムパスを通す必要のあるプラグインを使用する場合、
"$MY_VIMRUNTIMEを使用すると Windows/Linuxで切り分ける必要が無くなります。
"例) vimfiles/qfixapp (Linuxでは~/.vim/qfixapp)にランタイムパスを通す場合
"set runtimepath+=$MY_VIMRUNTIME/qfixapp

"----------------------------------------
" 内部エンコーディング指定
"----------------------------------------
"内部エンコーディングのUTF-8化と文字コードの自動認識設定をencode.vimで行う。
"オールインワンパッケージの場合 vimrcで設定されているので何もしない。
"エンコーディング指定や文字コードの自動認識設定が適切に設定されている場合、
"次行の encode.vim読込部分はコメントアウトして下さい。
silent! source $MY_VIMRUNTIME/pluginjp/encode.vim
"scriptencodingと異なる内部エンコーディングに変更する場合、
"変更後にもscriptencodingを指定しておくと問題が起きにくくなります。
scriptencoding cp932

"----------------------------------------
" システム設定
"----------------------------------------
"mswin.vimを読み込む
"source $VIMRUNTIME/mswin.vim
"behave mswin

"ファイルの上書きの前にバックアップを作る/作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set nowritebackup
"バックアップ/スワップファイルを作成する/しない
set nobackup
if version >= 703
  "再読込、vim終了後も継続するアンドゥ(7.3)
  "set undofile
  "アンドゥの保存場所(7.3)
  "set undodir=.
endif
"set noswapfile
"viminfoを作成しない
"set viminfo=
"クリップボードを共有
set clipboard+=unnamed
"8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
"キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeoutlen=3500
"編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden
"ヒストリの保存数
set history=50
"日本語の行の連結時には空白を入力しない
set formatoptions+=mM
"Visual blockモードでフリーカーソルを有効にする
set virtualedit=block
"カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>
"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
"コマンドライン補完するときに強化されたものを使う
set wildmenu
"マウスを有効にする
if has('mouse')
  set mouse=a
endif
"pluginを使用可能にする
filetype plugin indent on

"----------------------------------------
" 検索
"----------------------------------------
"検索の時に大文字小文字を区別しない
"ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase
"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
"インクリメンタルサーチ
set incsearch
"検索文字の強調表示
set hlsearch
"w,bの移動で認識する文字
"set iskeyword=a-z,A-Z,48-57,_,.,-,>
"vimgrep をデフォルトのgrepとする場合internal
"set grepprg=internal

"----------------------------------------
" 表示設定
"----------------------------------------
"スプラッシュ(起動時のメッセージ)を表示しない
"set shortmess+=I
"エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell
set visualbell t_vb=
"マクロ実行中などの画面再描画を行わない
"set lazyredraw
"Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash
"行番号表示
set number
if version >= 703
  "相対行番号表示(7.3)
	set relativenumber
endif

"相対行表示
nnoremap <silent> [Prefix]1 :set relativenumber<CR>
nnoremap <silent> [Prefix]2 :set number<CR>

"括弧の対応表示時間
set showmatch matchtime=1
"タブを設定
set ts=2 sw=2 sts=2
"自動的にインデントする
set autoindent
"Cインデントの設定
set cinoptions+=:0
"タイトルを表示
set title
"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=2
set laststatus=2
"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~

set t_Co=256

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

"色テーマ設定
"gvimの色テーマは.gvimrcで指定する
"colorscheme mycolor
"colorscheme molokai
"colorscheme darkblue
syntax enable
set background=dark
"colorscheme solarized

let g:hybrid_use_Xresources = 1
colorscheme hybrid
""""""""""""""""""""""""""""""
"ステータスラインに文字コード等表示
"iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
""""""""""""""""""""""""""""""
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
endif

"FencB() : カーソル上の文字コードをエンコードに応じた表示にする
function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

"----------------------------------------
" diff/patch
"----------------------------------------
"diffの設定
if has('win32') || has('win64')
  set diffexpr=MyDiff()
  function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let cmd = '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    silent execute cmd
  endfunction
endif

"現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
"パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

"----------------------------------------
" ノーマルモード
"----------------------------------------
"ヘルプ検索
nnoremap <F1> K
"現在開いているvimスクリプトファイルを実行
nnoremap <F8> :source %<CR>
"強制全保存終了を無効化
nnoremap ZZ <Nop>
"カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
"キーボードマクロには物理行移動を推奨
"h l は行末、行頭を超えることが可能に設定(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
"l を <Right>に置き換えても、折りたたみを l で開くことができるようにする
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif


" カーソルキー
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>

"----------------------------------------
" 挿入モード
"----------------------------------------

"----------------------------------------
" ビジュアルモード
"----------------------------------------

"----------------------------------------
" コマンドモード
"----------------------------------------

"----------------------------------------
" Vimスクリプト
"----------------------------------------
""""""""""""""""""""""""""""""
"ファイルを開いたら前回のカーソル位置へ移動
"$VIMRUNTIME/vimrc_example.vim
""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインのカラー変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
    redraw
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので、scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"強調表示されない場合、ここでscriptencodingを指定するとうまくいく事があります。
"scriptencoding cp932
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  "全角スペースを明示的に表示する
  silent! match ZenkakuSpace /　/
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif

""""""""""""""""""""""""""""""
" neocomplcache
""""""""""""""""""""""""""""""
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_underbar_completion = 1

""""""""""""""""""""""""""""""
"grep,tagsのためカレントディレクトリをファイルと同じディレクトリに移動する
""""""""""""""""""""""""""""""
"if exists('+autochdir')
"  "autochdirがある場合カレントディレクトリを移動
"  set autochdir
"else
"  "autochdirが存在しないが、カレントディレクトリを移動したい場合
"  au BufEnter * execute ":silent! lcd " . escape(expand("%:p:h"), ' ')
"endif

"----------------------------------------
" Neobundle のプロキシ環境での設定
"  プロキシ環境に~/.vimrc.local を用意する
"----------------------------------------
if filereadable($HOME . '/.vimrc.local')
	source $HOME/.vimrc.local
endif

"let g:neobundle_default_git_protocol='https'
"----------------------------------------
" 各種プラグイン設定
"----------------------------------------
"Vi互換OFF
set nocompatible
filetype off
 
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif
 
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
"after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.git'

" rails 
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'

NeoBundle 'scrooloose/nerdtree.git'

NeoBundle 'mattn/zencoding-vim.git'
"NeoBundle 'dbext'

"NeoBundle 'Townk/vim-autoclose.git'

NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'

NeoBundle 'thinca/vim-quickrun'

NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'leafgarland/typescript-vim'

" シングルクォートやカッコなど処理を簡単にします
" http://d.hatena.ne.jp/secondlife/20061225/1167032528
NeoBundle 'tpope/vim-surround'

" 目的の行に素早く移動する
NeoBundle 'Lokaltog/vim-easymotion.git'

" Multi
NeoBundle 'terryma/vim-multiple-cursors.git'

" Doxygen usage :Dox
NeoBundle 'vim-scripts/DoxygenToolkit.vim'

" R lang:
NeoBundle 'https://github.com/ervandew/screen'
NeoBundle 'https://github.com/jcfaria/Vim-R-plugin.git'

"ファイル形式別プラグインのロードを有効化
filetype plugin on
filetype indent on


" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'

" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

NeoBundle 'nathanaelkane/vim-indent-guides'

" markdown
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'tpope/vim-markdown'

" ステータスラインを格好良く
"NeoBundle 'Lokaltog/vim-powerline'
"NeoBundle 'lokaltog/powerline'
NeoBundle 'itchyny/lightline.vim'
"" lightlineの連携（なくてもよい） 
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'aklt/plantuml-syntax'
"----------------------------------------
"
" NERDTree 設定
"----------------------------------------
"NERDTreeを+|`などを使ってツリー表示をする。
""ディレクトリが閉じている場合には+を先頭につける。
"ディレクトリが開いている場合には~を先頭につける。
""ファイルには-を先頭につける。
let g:NERDTreeDirArrows=0

let g:instant_markdown_slow = 1
"----------------------------------------
" 一時設定
"----------------------------------------

""""""""""""""""""""""""""""""
" neocomplcache
""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1

"-----------------------------
" gist.vim
"-----------------------------
let g:gist_show_privates=1
let g:gist_post_private=1

"-----------------------------
" vim-indent-guides 
"-----------------------------
"vim立ち上げ時に自動的にvim-indent-guidesをオン=1にする。
let g:indent_guides_enable_on_vim_startup = 0
"autoで色付けするのはストップ
let g:indent_guides_auto_colors = 0
"色の変化幅（？）パーセンテージ
let g:indent_guides_color_change_percent = 30
"奇数行の色付け
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg = red
"hi IndentGuidesOdd ctermbg=black
"偶数行の色付け
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg = darkgrey
"hi IndentGuidesEven ctermbg=darkgrey
"インデントの色付け幅
let g:indent_guides_guide_size = 1

" coffee script setting 
autocmd FileType coffee setlocal dictionary=$HOME/dotfiles/vimfiles/javascript.dict,$HOME/dotfiles/vimfiles/jQuery.dict
autocmd FileType javascript,coffee setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType coffee set tabstop=4 shiftwidth=4
autocmd BufWritePost *.coffee silent CoffeeMake! -c | cwindow | redraw!

" quickrun setting
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}

"NERDTreeはNeoBundleでインストール済み。
""scrooloose/nerdtree GitHub
"https://github.com/scrooloose/nerdtree
"NeoBundle 'scrooloose/nerdtree.git'
"
"<C-e>でNERDTreeをオンオフ。いつでもどこでも。
"map <silent> <C-e>   :NERDTreeToggle<CR>
"lmap <silent> <C-e>  :NERDTreeToggle<CR>
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

"引数なしでvimを開いたらNERDTreeを起動、
"引数ありならNERDTreeは起動しない、引数で渡されたファイルを開く。
"How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd vimenter * if !argc() | NERDTree | endif

"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"NERDChristmasTree カラー表示する。
"Defaultでカラー表示、カラースキーマを設定しているとそちらが優先される？
"Values: 0 or 1.
"Default: 1.
"let g:NERDChristmasTree=0
"let g:NERDChristmasTree=1

"ファイルオープン後の動作 
"0 : そのままNERDTreeを開いておく。
"1 : NERDTreeを閉じる。
"Values: 0 or 1.
"Default: 0
"let g:NERDTreeQuitOnOpen=0
"let g:NERDTreeQuitOnOpen=1

"NERDTreeIgnore 無視するファイルを設定する。
"'\.vim$'ならばfugitive.vimなどのファイル名が表示されない。
"\ エスケープ記号
"$ ファイル名の最後
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
"let g:NERDTreeIgnore=['\.vim$', '\.clean$']
"let g:NERDTreeIgnore=['\.vim$', '\~$']
"let g:NERDTreeIgnore=[]

"NERDTreeShowHidden 隠しファイルを表示するか？
"f コマンドの設定値
"0 : 隠しファイルを表示しない。
"1 : 隠しファイルを表示する。
"Values: 0 or 1.
"Default: 0.
"let g:NERDTreeShowHidden=0
let g:NERDTreeShowHidden=1

"ディレクトリだけ表示してファイル名は隠す。
"ファイルの表示、非表示をトグルするときの初期値。
"F コマンドの設定初期値
"0 : 最初からファイルを表示しない。
"1 : 最初からファイルを表示する。
"Values: 0 or 1.
"Default: 1.
"let g:NERDTreeShowFiles=0
"let g:NERDTreeShowFiles=1

"カーソルラインをハイライト表示する。
"（カラースキーマが優先される？）
"0 : 色付けしない。
"1 : カラー表示をする。
"Values: 0 or 1.
"Default: 1.
"let g:NERDTreeHighlightCursorline=0
"let g:NERDTreeHighlightCursorline=1

"ブックマークリストの表示。
"0 : ブックマークリストを最初から表示しない。
"1 : ブックマークリストを最初から表示する。
"Values: 0 or 1.
"Default: 0.
"let g:NERDTreeShowBookmarks=0
"let g:NERDTreeShowBookmarks=1

"NERDTreeのツリーを開く場所、左側か、右側か。
"Values: "left" or "right"
"Default: "left".
"let g:NERDTreeWinPos="left"
"let g:NERDTreeWinPos="right"

"NERDTreeのツリーの幅
"Default: 31.
"let g:NERDTreeWinSize=45

"ブックマークや、ヘルプのショートカットをメニューに表示する。
"0 表示する
"1 表示しない
"Values: 0 or 1.
"Default: 1.
"let g:NERDTreeMinimalUI=0
let g:NERDTreeMinimalUI=1

"NERDTreeを+|`などを使ってツリー表示をする。
"ディレクトリが閉じている場合には+を先頭につける。
"ディレクトリが開いている場合には~を先頭につける。
"ファイルには-を先頭につける。
"0 : 綺麗に見せる。
"1 : +|`などを使わない
"Values: 0 or 1
"Default: 1.
let g:NERDTreeDirArrows=0
"let g:NERDTreeDirArrows=1

"マウス操作方法
"NERDTreeMouseMode
"Values: 1, 2 or 3.
"Default: 1.
"1 : ファイル、ディレクトリ両方共ダブルクリックで開く。
"2 : ディレクトリのみシングルクリックで開く。
"3 : ファイル、ディレクトリ両方共シングルクリックで開く。
"let g:NERDTreeMouseMode=1
let g:NERDTreeMouseMode=2
"let g:NERDTreeMouseMode=3

"NERDTreeBookmarksFile
"ブックマークを記録したファイルの設置場所を指定。
"Values: a path
"Default: $HOME/.NERDTreeBookmarks

"NERDTreeShowLineNumbers
"0 : 行番号を表示しない。
"1 : 行番号を表示する。
"Values: 0 or 1.
"Default: 0.
"let NERDTreeShowLineNumbers=0
"let NERDTreeShowLineNumbers=1

"NERDTreeStatusline NERDtreeウィンドウにステータスラインを表示。
"Values: Any valid statusline setting.
"Default: %{b:NERDTreeRoot.path.strForOS(0)}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tag" その他オプション
"tag" 未設定＆未使用＆未翻訳。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"loaded_nerd_tree			NERDTreeスクリプトの読み込み設定 プラグインのオンオフなど？？？。
"NERDTreeChDirMode		vimのカレントディレクトリを変更するタイミングを設定する？？？
"NERDTreeSortOrder		ソート順を設定

"|'NERDTreeAutoCenter'|          Controls whether the NERD tree window centers
"						"                                when the cursor moves within a
"						specified
"						"                                distance to the top/bottom of the
"						window.
"						"|'NERDTreeAutoCenterThreshold'| Controls the sensitivity of
"						autocentering.
"
"						"|'NERDTreeCaseSensitiveSort'|   Tells the NERD tree whether to
"						be
"						case
"						"                                sensitive or not when sorting
"						nodes.
"
"						"|'NERDTreeHijackNetrw'|         Tell the NERD tree whether to
"						replace the netrw
"						"                                autocommands for exploring local
"						directories.

"----------------
" powerline
" ---------------
"set rtp+=/home/kouji/.vim/bundle/powerline/powerline/bindings/vim

"set guifont = Source\ Code\ Pro\ for\ Powerline:h10
set guifont=Ricty\ 10

"let g:Powerline_symbols='fancy'

if has('unix') && !has('gui_running')
	inoremap <silent> <Esc> <Esc>
	inoremap <silent> <C-[> <Esc>
endif
	
" symotion の設定
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" Multiple cursors

" 自動的にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

" surround
" 45 -> '-' command
let g:surround_45 = "<!-- \ -->"


autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow




" vim-gitgutter
"let g:gitgutter_sign_added = '✚'
"let g:gitgutter_sign_modified = '➜'
"let g:gitgutter_sign_removed = '✘'

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'separator' : {'left': "\ue0b0", 'right': "\ue0b2"},
        \ 'subseparator' : {'left': "\ue0b1", 'right': "\ue0b3"},
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ }}
"if has('multi_byte')
"	let g:lightline.separator = {'left': '⮀', 'right': '⮂'}
"  let g:lightline.subseparator = {'left': '⮁', 'right': '⮃'}
"endif

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%t') ? expand('%t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
	  endtry
	  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
     \ || ! get(g:, 'gitgutter_enabled', 0)
     \ || winwidth('.') <= 100
   return ''
  endif
  let symbols = [
      \ g:gitgutter_sign_added . ' ',
      \ g:gitgutter_sign_modified . ' ',
      \ g:gitgutter_sign_removed . ' '
      \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
	endif

	" Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif
	" Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
     let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
	" This matches the two first pieces of the return value, e.g.
	" "<F>  70" => char: 'F', nr: '70'

	let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')
	" Format the numeric value
	let nr = printf(nrformat, nr)

	return "'". char ."' ". nr
endfunction
" }}}
