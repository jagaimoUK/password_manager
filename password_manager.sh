#!/bin/zsh
# パスワードを追加する関数のの読み込み 
source ./add_password.sh

# 関数を定義
function selection(){
	echo '次の選択肢から入力してください(Add Password/Get Password/Exit)：'
	read action
}

function get_password (){	
	echo 'サービス名を入力してください：'
	read service_input
## サービス名が保存されていなかった場合
	if [[ $service_input != $service ]]; then
		echo 'そのサービスは登録されていません。'
## サービス名が保存されていた場合
	else
		echo サービス名：$service
		echo ユーザー名：$user
		echo パスワード名：$password
	fi
}
# パスワードマネージャー
echo 'パスワードマネージャーへようこそ！'

while true
do
## 選択肢を入力	
	selection
## Add Passwordが入力された場合 
	if [[ $action = "Add Password" ]]; then
		add_password
		gpg2 --yes -e -r jagaimo password.txt 
		continue
## Get Passwordが入力された場合
	elif [[ $action = 'Get Password' ]]; then
		gpg2 --yes -r jagaimo -o password.txt -d password.txt.gpg
		get_password 
		continue
## Exit が入力された場合
	elif [[ $action = 'Exit' ]]; then 
		echo 'Thank you!'
### プログラムが終了
		break
## Add Password/Get Password/Exit 以外が入力された場合
	else  
		echo '入力が間違えています。Add Password/Get Password/Exit から入力してください。'
	fi
done
