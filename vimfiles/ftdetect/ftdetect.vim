au BufRead,BufNewFile *.pongo setf html
" scalaが拡張子のファイルはファイルタイプをscalaとして読みこむ
au BufNewFile,BufRead *.scala setf scala
au BufNewFile,BufRead *.template setf yaml
au BufNewFile,BufRead *.hql setf sql
au BufNewFile,BufRead *.config setf yaml
au BufNewFile,BufRead *.yml setf yaml
