#!/bin/sh

src="$1"
dest="$2"

[ -z "$src" ] && src="../src"
[ -z "$dest" ] && dest="../www"

build_dir () {
	[ -z "$1" ] && return
	[ -d "$1" ] || mkdir "$1"
}

for i in $(find $src | grep -vE "\.ssgignore|template\.html|res/"); do
	target=$(echo "$i" | sed "s $src $dest " | sed "s/.md$/.html/")
	# Decide whether to build or not
	build_i=''
	[ -d "$i" ] && build_dir "$target" && continue
	[ -f "$target" ] || build_i=yes
	[ -z $build_i ] && [ $(stat -c %Y "$i") -gt $(stat -c %Y "$target") ] && build_i=yes
	[ -z $build_i ] && continue
	# Build
	echo "Building $target from $i"
	replacer/replace "$i" -t "$src/template.html" -c ./smu > "$target"
done

# TODO create blog
