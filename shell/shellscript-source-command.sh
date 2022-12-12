#!/usr/bin/bash

# シェルスクリプトA・Bを作成
touch a.sh b.sh

# シェルスクリプトBにコマンドを記載
echo 'echo "It works!!"' >  b.sh
echo 'b_variable=100' >>  b.sh

# シェルスクリプトAにコマンドを記載
# sourceコマンドを利用し、シェルスクリプトAの中でシェルスクリプトBを実行する
echo 'source  ./b.sh' > a.sh
echo 'echo ${b_variable}' >> a.sh

# chmodコマンドを実行して権限を付与
chmod 755 a.sh b.sh

# a.shを実行
./a.sh