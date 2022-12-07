#!/usr/bin/bash

#1.配列の初期化
name_array1[0]="name1"
name_array1[1]="name2"
name_array1[2]="name3"

# 複数の値を同時に代入可能
name_array2=("name4" "name5" "name6")


#2.配列の参照 
#インデックスを指定する場合、インデックス部分も含めて{}で囲む。
echo ${name_array1[2]}

#インデックスを指定しない場合は、先頭の値のみが出力されます。
echo $name_array1


#3.全要素を参照する
# {配列名[@]}、もしくは{配列名[*]}で配列内にある全ての値を参照が可能
fruit_array=("lemon" "apple" "grape")

echo ${fruit_array[@]}
echo ${fruit_array[*]}


#4.配列と繰り返し処理
#全ての要素を繰り返し処理でechoする /「@」の場合、配列の要素が個別に扱われます。
for i in "${fruit_array[@]}"
do
  echo $i
done

# 「*」の場合、配列の要素が１つで扱われます。そのため、ループが一回で終了します
for i in "${fruit_array[*]}"; 
do 
  echo $i; 
done


#5.配列の削除
#配列の値の削除、配列全体の削除は、unsetを使用する

#配列の二番目を削除
unset fruit_array[1]
echo ${fruit_array[@]}

#インデックスを指定しない場合は、配列全体を削除します。
unset fruit_array
echo ${fruit_array[@]}


#6.配列の要素の個数と要素の長さ
# "#" は、長さを表します。
#配列に格納された要素数を調べるには、${#array[@]}もしくは${#array[*]}
fruit_array2=("melon" "strawberry" "cherry")
echo ${#name_array2[@]}

# #array[index]要素を指定すると、要素の長さを参照可能
echo ${#name_array2[0]}


#7.配列に要素を追加する
#単一要素を追加する/ 配列名+=(値)
echo ${fruit_array2[@]}
fruit_array2+=("banana")

#４つ目の要素が追加されている
echo ${fruit_array2[@]}

#同時に複数要素を追加することも可能/ 配列名+=(値1 値2 値3)
fruit_array2+=("watermelon" "kiwi")
echo ${fruit_array2[@]}

#変数の値を配列の要素として追加することも可能/ 配列名+=($変数名)
element="pine"

#「""」で囲んで変数の値を 1 つの要素として追加する。
fruit_array2+=("$element")
echo ${fruit_array2[@]}

