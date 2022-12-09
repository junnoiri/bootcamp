#!/bin/bash

#コマンドライン引数 
#パラメーターの参照には$1 〜 $9が使用可能
# コマンドライン引数にデフォルト値を指定することも可能
echo '1 番目: ' "${1:-default AAA}"
echo '2 番目: ' "${2:-default BBB}"
echo '3 番目: ' "${3:-default CCC}"

#指定されたコマンドライン引数の数を取得する($#)
echo 引数の数: $#

#コマンドライン引数をループで順番に処理する ($@, $*)
#特殊変数の指定部分 in "$@" は省略して記述することが可能
echo -e '\n=== "$@" の場合 ==='
count=1
for argument in "$@"; do
  echo "$count: $argument"
  let count=$count+1
done

#引数全体を 1 つの文字列として取得する ($*)
echo -e '\n=== "$*" の場合 ==='
for argument in "$*"; do
  echo "$argument"
done