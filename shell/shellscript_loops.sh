#!/usr/bin/zsh

#for文

#数値を繰り返す
for index in 1 2 3 4 5 6 7 8 9
do
  echo "${index}"
done

#文字列を繰り返す
for index in 'cabbage' 'lettuce' 'onion' 'broccoli' 'carrots'
do
  echo "${index}"
done

#seqで回数を指定する
for index in `seq 15`
do
  echo "${index}人"
done

#while文

#コンソールから入力された文字列が"enginner"であれば、処理が終了する
input=' '
while [ $input != 'engineer' ]
do
  echo 'Enter "engineer"'
  read input
done
