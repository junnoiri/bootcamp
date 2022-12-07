#!/usr/bin/zsh

#数値の比較
number=20

if [ $number -gt 40 ]; then
  echo '40よりも大きい'
elif [ $number -lt 50 ]; then
  echo '50よりも小さい'
elif [ $number -eq 60 ]; then
  echo '60と等しい'
elif [ $number -ne 70 ]; then
  echo '70と等しくない'
elif [ $number -ge 80 ]; then
  echo '80以上'
elif [ $number -le 90 ]; then
  echo '90以下'
else
  echo 'other' 
fi 

if [ $number -ge 90 ] && [ $number -le 100 ]; then
  echo '90以上かつ100以下'
elif [ $number -ge 20 ] || [ $number -le 100 ]; then
  echo '20以上または100以下'
else
  echo 'other'
fi

#文字列の比較
string1='jun'
string2='engineer'

if [ $string1 != $string2 ]; then
  echo '文字列は等しくありません。'
fi

#ファイルの確認
if [ ! -f ./shellscript_conditional_statements.sh ]; then
  echo 'ファイルが存在しません'
else
  echo 'ファイルが存在します'
fi
