#!/bin/zsh
function add_password(){
	echo 'サービス名を入力してください：'
	read service
	echo 'ユーザー名を入力してください：'
	read user
	echo 'パスワードを入力してください：'
	read password
	echo "サービス名:$service ユーザ名:$user パスワード:$password" >> password.txt
	# 入力が完了したら
	echo 'パスワードの追加は成功しました。'
}
