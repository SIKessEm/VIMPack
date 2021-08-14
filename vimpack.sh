#!/bin/bash -e
#SIKessEm
#Package Manager for VIM >= 8


action=$1
author=$2
vendor=$3
plugin=$4

case $action in
	'add' | 'a')
		pack='opt'
		;;
	'use' | 'u')
		pack='start'
		;;
	*)
		echo "Unknown command $action"
		exit 1
		;;
esac


if [[ -n $5 ]]; then
	echo "Unexpected argument $5"
	exit 1
fi


while [[ -z $author ]]; do
	read -p 'Author name : ' author
done

while [[ -z $vendor ]]; do
	read -p 'Vendor name : ' vendor
done



if [[ -z $plugin ]]; then
	plugin=$vendor
fi

git clone --depth 1 https://github.com/${author}/${vendor}.git ~/.vim/pack/vendor/${pack}/${plugin}
