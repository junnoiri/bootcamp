#!/usr/bin/bash

# 引数が渡されたことをif文で確認する
if [ -n "$1" ]; then
  echo "Parameter passed = $1"
  path="${1}"
  
  # pathの最初の文字列に"/"が最初にあれば、絶対パス
  if [ "${path:0:1}" = "/" ]; then
    echo 'The file path is absolute path.'
  else 
    echo 'The file path is relative path.'
  fi

else
  # パラメータが渡されていない場合、メッセージを出力
  echo 'No parameter passed'
fi
