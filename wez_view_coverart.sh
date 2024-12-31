#!/usr/bin/env bash
# Author: noncomplete <m.labib027@gmail.com>
# A dead simple cover art viwer for wezterm.
# Intended for use with ncspot.

TRACKID="$(playerctl metadata mpris:trackid)"
ARTURL="$(playerctl metadata mpris:artUrl)"
IMGADDR=$HOME/temp/cover_art.png

get_cover() {
  wget -q "$(playerctl metadata mpris:artUrl)" -O "$IMGADDR"
  wezterm imgcat "$IMGADDR"
}
clear
get_cover

while true; do
  #NEW_TRACKID="$(playerctl metadata mpris:trackid)"
  NEW_ARTURL="$(playerctl metadata mpris:artUrl)"
  #if [[ "$TRACKID" == "$NEW_TRACKID" ]]; then
  if [[ "$ARTURL" == "$NEW_ARTURL" ]]; then
    sleep 2
  else
    clear
    get_cover
    #TRACKID="$NEW_TRACKID"
    ARTURL="$NEW_ARTURL"
  fi
done
