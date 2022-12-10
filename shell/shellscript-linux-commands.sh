#!/usr/bin/bash

#linux command (コマンド: 説明/使用例)

# - ps
# OS内部で現在実行されているプロセス一覧を表示する
# プロセスのID（PID）やCPU使用時間、コマンド名、端末番号、ユーザー名などを確認する/
ps


# - curl
# 様々な通信プロトコルでデータの送受信を行うことができる/
curl http://www.google.com/


# - top
# 現在実行中のプロセスをCPU利用率が高い順に表示する/
top


# - grep
# ファイルから特定の「文字列（文字のパターン）」が存在するかを調べる/
# "array"という文字列を含んだ全てのファイルをディレクトリから探す。
grep array ./* 


# - tail
# ファイルの最終行から数行を表示するコマンド/
# -nオプションで出力する行数を指定する
tail -n 2 shellscript-linux-commands.sh


# - find
# ファイルやディレクトリを検索する
# ワイルドカード（*）で複数ファイルを同時に検索する
find shellscript*


# - chmod
# ファイルやディレクトリにアクセスするにはファイルの「パーミッション（許可属性）」によって決まる
# パーミッションには「読み出しの許可」「書き込みの許可」「実行の許可」の3種類があります。
# パーミッションを変更するコマンドが「chmod」/

# "ls -l"コマンドで、現在設定されているパーミッションを確認
ls -l shellscript-linux-commands.sh

# 全てのパーミッションで読み込み書き込み実行を許可する
chmod 777 shellscript-linux-commands.sh

# グループの実行権のみ読み込みのみの権限にする
chmod 747 shellscript-linux-commands.sh


# - chown
# ファイルやディレクトリのユーザーやグループの所有権を変更するためのコマンド/

# 現在設定されているパーミッションを確認
ls -l shellscript-linux-commands.sh

# シェルスクリプトのユーザー所有権を変更する
# 所有権を変更するためには"su"コマンドでスーパーユーザーに変更する必要がある
chown root shellscript-linux-commands.sh


# "&"
# Macでバックグラウンド処理を行うには、バックグラウンドで実行したいコマンドの後に「&」を指定
# ターミナルからサーバープログラムを起動する際によくこの記法を使う/

# バックグラウンドでsleepコマンドを実行
sleep 10 &

# jobsコマンドでバックグラウンドで実行中のプログラムを確認できる
jobs


#　- "&&"
# 複数コマンドを実行できる
echo 123 && echo abc