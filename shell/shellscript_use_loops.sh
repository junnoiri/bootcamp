#!/usr/bin/zsh

#for文

#数値を繰り返す
for i in 1 2 3 4 5 6 7 8 9
do
  echo $i
done

#文字列を繰り返す
for i in cabbage lettuce onion broccoli carrots
do
  echo $i
done

#seqで回数を指定する
for i in `seq 15`
do
  echo $i人
done

#while文

#回数を指定して繰り返す
i=0
while [ $i -ne 10 ]
do
  echo $i回目
  i=`expr 1 + $i`
done

#コンソールから入力された文字列が"enginner"である限り、処理が実行する
read input
while [ $input = engineer ]
do
  echo Be engineer
  read input
done
