
[ -z "$src" ] && export src="../src"
[ -z "$dest" ] && export dest="../www"

export websitename="https://www.nmke.de"
export blogs="blog	Blog
blog2	Blog 2"

unset build_items
build_items () {
	[ -z "$1" ] && return # item
	build_item "$1" "$src/template_rss.xml" -R >> "$dest/.tmp/rss.xml"
	build_item "$1" "$src/template_atom.xml" -I >> "$dest/.tmp/atom.xml"
}

unset build_feed
build_feed () {
	[ -z "$1" ] && return # blogdir
	[ -z "$2" ] && return # blogtitle
	replacer/replace "$dest/.tmp/rss.xml" -t "$src/template_rssi.xml" -c /usr/bin/cat > "$dest/$1/rss.xml"
	replacer/replace "$dest/.tmp/atom.xml" -t "$src/template_atomi.xml" -c /usr/bin/cat -D "$(date -I)" -U "$websitename/$1" -T "$2" > "$dest/$1/atom.xml"
}
