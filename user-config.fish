function fish_greeting
end
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end
if command -v z >/dev/null
    alias cd=z
end

function nvchad
    env NVIM_APPNAME=nvchad nvim $argv
end

abbr c clear
abbr n nvchad
abbr upd "sudo pacman -Syu"
abbr i "sudo pacman -S"
afunction cc
    tee /dev/tty | wl-copy
end
funcsave ccbbr del "sudo pacman -Rns"
