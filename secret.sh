#!/bin/bash

secret_hash_file=/home/aman/.config/hypr/.secret_hash
rasi_theme="$HOME/.config/rofi/secret-pass.rasi"

if [ ! -r "$secret_hash_file" ]; then
  exit 1
fi
Stored_hash=$(tr -d '[:space:]' <"$secret_hash_file")

rofi_args=(-dmenu -password -p "Password")
if [ -r "$rasi_theme" ]; then
  rofi_args+=(-theme "$rasi_theme")
fi

password=$(rofi "${rofi_args[@]}")
[ -n "$password" ] || exit 1

input_hash=$(printf '%s' "$password" | sha256sum | cut -d' ' -f1)

if [ "$Stored_hash" = "$input_hash" ]; then
  if hyprctl clients -j | grep -q '"name": "special:secret"'; then
    hyprctl dispatch 'hl.dsp.workspace.toggle_special("secret")'
  else
    hyprctl dispatch 'hl.dsp.focus({ workspace = "special:secret" })'
    hyprctl dispatch 'hl.dsp.exec_cmd("brave", { workspace = "special:secret" })'
  fi
else
  exit 1
fi
