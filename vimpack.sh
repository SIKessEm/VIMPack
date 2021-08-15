#!/bin/bash -e
#SIKessEm
#package Manager for VIM >= 8


case $1 in
	'add' | 'a')
		action='make'
		pack='opt'
		;;
	'use' | 'u')
		action='make'
		pack='start'
		;;
	'added' | 'A')
		action='list'
		pack='opt'
		;;
	'used' | 'U')
		action='list'
		pack='start'
		;;
	*)
		echo "Unknown command $action"
		exit 1
		;;
esac


make_pack() {
	author=$1
	vendor=$2
	plugin=$3


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
}

list_pack() {
	plugin=$1

	if [[ -n $2 ]]; then
		echo "Unexpected argument $2"
		exit 1
	fi


	while [[ -z $plugin ]]; do
		read -p 'Plugin name : ' plugin
	done

	ls ~/.vim/pack/vendor/${pack}/${plugin}
}
	
if [ $action = 'make' ]; then
	make_pack $2 $3 $4 $5
elif [ $action = 'list' ]; then
	list_pack $2 $3
fi

