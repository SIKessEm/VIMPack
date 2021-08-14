#!/bin/bash -e
#SIKessEm
#Package Manager for VIM >= 8

author=$1
vendor=$2
plugin=$3

while [[ ! -n $author ]]; do
	read -p "Author name : " author
done

while [[ ! -n $vendor ]]; do
	read -p "Vendor name : " vendor
done

if [[ ! -n $plugin ]]; then
	plugin=$vendor
fi

git clone --depth 1 https://${author}/${vendor}.git ~/.vim/pack/vendor/start/${plugin}
