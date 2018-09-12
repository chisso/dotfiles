"---------------------------------------------------
" NeoBundles Setting
"---------------------------------------------------
if has('vim_starting')
  set nocompatible               " be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" ファイルオープン
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" Railsでslimを使う場合のhighlight
NeoBundle 'slim-template/vim-slim'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" coffee scripts
NeoBundle 'kchmck/vim-coffee-script'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化(うまく動かない？)
NeoBundle 'bronson/vim-trailing-whitespace'
" less用のsyntaxハイライト
NeoBundle 'KohPoll/vim-less'

" go highlight etc.
NeoBundle 'fatih/vim-go'

" javascript indenting
NeoBundle 'jelera/vim-javascript-syntax'
"NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'jiangmiao/simple-javascript-indenter'

" twig highlight
NeoBundle 'evidens/vim-twig'

" scala用syntax highlight
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'gre/play2vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck


"""""""""""""""""""""""""""""""""""""""""""
" オプションの設定
"""""""""""""""""""""""""""""""""""""""""""
" タグファイルの指定
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
"set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme molokai
set t_Co=256
" 行番号の色
highlight LineNr ctermfg=darkyellow
""""""""""""""""""""""""""""""
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始しない
let g:unite_enable_start_insert=0
" Uniteを開く時、垂直分割で開く
let g:unite_enable_split_vertically=1

let g:unite_data_directory = $HOME.'/.cache/neomru'
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
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

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
""""""""""""""""""""""""""""""
"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup

"================================================================================
" quickrun settings
"================================================================================
let g:quickrun_config = {}
augroup quickrun_settings
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  autocmd BufRead,BufNewFile *_test.go set filetype=go.test
augroup END

let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1,
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 10,
\   },
\  "ruby.rspec" : {
\       "command": "rspec",
\       "cmdopt": "bundle exec",
\       "exec": "%o %c %s",
\   },
\   "go.test": {
\       "command" : "go",
\       "exec" : ["%c test"],
\   },
\}

command! Ql :call QRunRspecCurrentLine()
fun! QRunRspecCurrentLine()
  let line = line(".")
  exe ":QuickRun -exec 'bundle exec rspec %s%o' -cmdopt ':" . line . " -cfd'"
endfun

command! Qf :call QRunRspecCurrentFile()
fun! QRunRspecCurrentFile()
  exe ":QuickRun -exec 'bundle exec rspec %s -cfd'"
endfun

let NERDTreeDirArrows=0

"=================================================================================
" js関係syntasitc
"=================================================================================
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['javascript', 'jade'], 'passive_filetypes': []}
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_jade_checkers = ['jade_lint']
augroup JsConfig
  autocmd!
  ""autocmd BufWrite *.{js,json,jade} :Autoformat
  autocmd BufWrite *.{js,json,jade} :SyntasticCheck
  autocmd BufWrite *.{js,json,jade} :Errors
augroup END

"=================================================================================
" vim indent guides
"=================================================================================
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
set expandtab
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi SpecialKey term=bold ctermfg=9
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven term=bold ctermfg=9 guibg=#262626 ctermbg=darkgray
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd term=bold ctermfg=9 guibg=#3c3c3c ctermbg=gray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1


"==============================
" Indent Settings
"==============================
" オートインデントを有効にする
set autoindent
set smartindent
set cindent
"Default setting
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab


"==============================
" setting in each file type
" ts : タブが対応する空白の数
" sts : タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
" sw : インデントの各段階に使われる空白の数
" et : タブにスペースを使う
"==============================

if has("autocmd")
  filetype plugin on
  filetype indent on

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType pongo      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType django     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jade       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et textwidth=80 cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby.rspec setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType manifest   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
endif

"==============================


command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

" vim起動時にNERDTree表示
" ファイル指定で開かれた場合はNERDTreeは表示しない
if !argc()
  autocmd vimenter * NERDTree
endif

" shift + o で、改行を挿入（insertにしない）
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

" nusでbackspaceが効かないので追記
set backspace=indent,eol,start

" js indent
let g:SimpleJsIndenter_BriefMode = 2
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1

"""" coffee scripts
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデント設定
" オートコンパイル
  "保存と同時にコンパイルする
"autocmd BufWritePost *.coffee silent make! 
  "エラーがあったら別ウィンドウで表示
autocmd QuickFixCmdPost * nested cwindow | redraw! 
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

set encoding=utf-8
set fileencodings=euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

""""" ここまで
" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on
