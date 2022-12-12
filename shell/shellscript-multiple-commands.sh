#!/usr/bin/bash

#  コマンドラインパラメータが渡されたことをif文で確認
if [ -n "$1" ]; then
  fileName="${1}"

  # 引数で渡されたファイル名のファイルを作成、その後,カレントディレクトリからのツリー構造を表示、最後に全体のファイル数を表示
  touch "${1}" | tree  



else
  # コマンドラインパラメータが渡されなかった場合、usageを表示
  echo 'No parameter passed. Pass a file name that you want to create.'
fi  

