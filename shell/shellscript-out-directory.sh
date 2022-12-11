#!/usr/bin/bash

# 引数が渡されたことをif文で確認
if [ -n "$1" ]; then
  integerNumber="${1}"

  # 渡された引数の回数分だけ繰り返し処理を行う
  for directoryIndex in `seq ${integerNumber}`
  do
    # -pオプションで# "out"ディレクトリを作成し、階層ディレクトリを作成
    mkdir -p out/"dir-${directoryIndex}"

    # 生成されたディレクトリにインデックス分の数のファイルを生成
    for fileIndex in `seq ${directoryIndex}`
    do
      touch out/"dir-${directoryIndex}"/"file-${fileIndex}"
    done

  done

else
  # パラメータが渡されていない場合、メッセージを出力
  echo 'No parameter passed'
fi  