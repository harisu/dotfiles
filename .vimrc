set nocompatible
filetype off            " for NeoBundle
 
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
 
" ここから NeoBundle でプラグインを設定します
" NeoBundle で管理するプラグインを追加します。

NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/unite.vim.git'


NeoBundle 'Lokaltog/vim-easymotion'

filetype plugin indent on       " restore filetype

" ノーマルモードでカーソル位置の値をインクリメント、デクリメントする。
nnoremap + <C-a>
nnoremap - <C-x>

" 対応する括弧にカーソルが飛ぶ。時間は0.1秒×1
set showmatch
set matchtime=1

" 補完メニューの高さ
set pumheight=10

" 行表示
set number
" 相対行表示
"set relativenumber

" easymotion の設定
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

