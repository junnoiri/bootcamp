#!/usr/bin/bash

#echoで'You got 5 guesses. Guess 1 to 5'と言うメッセージを表示させ、１から５までの数値を当てるよう指示する。
echo 'You got 10 guesses. Guess 1 to 10'

#答えの数値を5で設定
correctNumber=5

#繰り返し処理のための変数を設定
result=false

#resultが文字列が"false"である限り、処理を繰り返し実行する
while [ $result = false ]
do
  #ターミナルからの入力を取得する
  read guessNumber

  if [ $guessNumber -ne $correctNumber ]; then
    echo 'Wrong guess Try again!'
  else
    echo 'Correct!! Good guess!!'
    result=true
  fi

done


