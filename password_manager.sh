#!/bin/zsh
source ./add_password.sh
function selection(){
	echo '次の選択肢から入力してください(Add Password/Get Password/Exit)：';
	read action;
}


echo 'パスワードマネージャーへようこそ！'

while true
do 
	selection
	if [[ $action = "Add Password" ]]; then
		add_password
		gpg2 --yes -e -r jagaimo password.txt 
		continue

		
# GetPassword が入力された場合
	elif [[ $action = 'Get Password' ]]; then
		gpg2 --yes -r jagaimo -o password.txt -d password.txt.gpg
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
		continue
# Exit が入力された場合
	elif [[ $action = 'Exit' ]]; then 
		echo 'Thank you!'
	## プログラムが終了
		break
	# Add Password/Get Password/Exit 以外が入力された場合
	else  
		echo '入力が間違えています。Add Password/Get Password/Exit から入力してください。'
	fi
done
