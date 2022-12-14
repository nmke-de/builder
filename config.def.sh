
[ -z "$src" ] && export src="$dn/../src"
[ -z "$dest" ] && export dest="$dn/../www"

export websitename="https://www.nmke.de"
export blogs="blog	Blog
blog2	Blog 2"

export ignorelist="/HANSI"

unset build_items
build_items () {
	[ -z "$1" ] && return # item
	build_item "$1" "$src/template_rss.xml" -R >> "$dest/.tmp/rss.xml"
	build_item "$1" "$src/template_atom.xml" -I >> "$dest/.tmp/atom.xml"
	build_item "$1" "$src/template_blog.html" -I >> "$dest/.tmp/index.html"
}

unset build_feed
build_feed () {
	[ -z "$1" ] && return # blogdir
	[ -z "$2" ] && return # blogtitle
	$dn/replacer/replace "$dest/.tmp/rss.xml" -t "$src/template_rssi.xml" -c /usr/bin/cat -D "$(date -R)" -U "$websitename/$1" -T "$2" > "$dest/$1/rss.xml"
	$dn/replacer/replace "$dest/.tmp/atom.xml" -t "$src/template_atomi.xml" -c /usr/bin/cat -D "$(date -I)" -U "$websitename/$1" -T "$2" > "$dest/$1/atom.xml"
	$dn/replacer/replace "$dest/.tmp/index.html" -t "$src/template.html" -c /usr/bin/cat -D "$(date -I)" -U "$websitename/$1" -T "$2" > "$dest/$1/index.html"
}
