#!/usr/bin/zsh

#数値の比較
NUMBER1=20

if [ $NUMBER1 -gt 40 ]; then
  echo "40よりも大きい"
elif [ $NUMBER1 -lt 50 ]; then
  echo "50よりも小さい"
elif [ $NUMBER1 -eq 60 ]; then
  echo "60と等しい"
elif [ $NUMBER1 -ne 70 ]; then
  echo "70と等しくない"
elif [ $NUMBER1 -ge 80 ]; then
  echo "80以上"
elif [ $NUMBER1 -le 90 ]; then
  echo "90以下"
else
  echo "other"  
fi 

if [ $NUMBER1 -ge 90 ] && [ $NUMBER1 -le 100 ]; then
  echo "90以上かつ100以下"
elif [ $NUMBER1 -ge 20 ] || [ $NUMBER1 -le 100 ]; then
  echo "20以上または100以下"
else
  echo "other"
fi

#文字列の比較
STRING1=jun
STRING2=engineer

if [ $STRING1 != $STRING2 ]; then
  echo '文字列は等しくありません。'
fi

#ファイルの確認
if [ ! -f ./shellscript_use_echo_command.sh ]; then
  echo 'ファイルが存在しません'
else
  echo 'ファイルが存在します'
fi
