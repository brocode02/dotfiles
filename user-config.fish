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

function del
    sudo pacman -Rns $argv
end

function upd
    sudo pacman -Syu
end

function i
    sudo pacman -S $argv
end
function nvchad
    env NVIM_APPNAME=nvchad nvim $argv
end

abbr c clear
