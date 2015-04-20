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

filetype plugin indent on       " restore filetype

