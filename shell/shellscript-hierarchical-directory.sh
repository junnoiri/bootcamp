#!/usr/bin/bash

# ディレクトリの生成
mkdir child-directory-a child-directory-b

# child-directory-a に test.txt を生成
touch child-directory-a/test.txt

# child-directory-a へ移動
cd child-directory-a 

# child-directory-a から child-directory-b へ test.txt を移動
mv test.txt ../child-directory-b/.

# child-directory-b へ移動
cd ../child-directory-b

# カレントディレクトリの test.txt を親ディレクトリへ移動
mv test.txt ../.

