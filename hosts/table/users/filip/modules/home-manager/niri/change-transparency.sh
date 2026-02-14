#!/usr/bin/env bash

DIR=$1

LOADED_VALUE=$(cat ~/.config/niri/dynamic-transparency.raw)

if [ "$DIR" = "more" ]; then
	if [ $LOADED_VALUE != "10" ]; then
		LOADED_VALUE=$(($LOADED_VALUE - 10))
	fi
elif [ "$DIR" = "less" ]; then
	if [ $LOADED_VALUE != "100" ]; then
		LOADED_VALUE=$(($LOADED_VALUE + 10))
	fi
fi

rm ~/.config/niri/dynamic-transparency.kdl
cat >~/.config/niri/dynamic-transparency.kdl <<EOF
window-rule {
  match is-floating=true is-focused=false
  opacity 0$(bc -l <<<"${LOADED_VALUE}/100")
}
EOF

echo -n "${LOADED_VALUE}" >~/.config/niri/dynamic-transparency.raw
