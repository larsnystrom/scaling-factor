#!/bin/sh

command -v gsettings >/dev/null 2>&1 || { echo >&2 "gsettings not found."; exit 1; }

SCALING_FACTOR=`gsettings get org.gnome.desktop.interface scaling-factor | cut -c7-`
TEXT_SCALING_FACTOR=`gsettings get org.gnome.desktop.interface text-scaling-factor`

[ -z "$SCALING_FACTOR" ] && { echo >&2 "could not get scaling-factor."; exit 1; }
[ -z "$TEXT_SCALING_FACTOR" ] && { echo >&2 "could not get text-scaling-factor."; exit 1; }

FACTOR=`echo "$SCALING_FACTOR * $TEXT_SCALING_FACTOR" | bc -l`

echo -n "$FACTOR"
exit 0
