if test -f "$XDG_RUNTIME_DIR/dbus-env"
    source $XDG_RUNTIME_DIR/dbus-env
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Everything here is to make nixpkgs work
if test -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    env -i bash -c "source '$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh'; env" | while read -l line
        set -l key (string split -m1 '=' -- $line)[1]
        set -l value (string split -m1 '=' -- $line)[2]
        if test -n "$key" -a -n "$value"
            if not contains $key PWD SHLVL _
                set -gx $key $value
            end
        end
    end
end

# add nixpkgs desktop files to xdg so fuzzel can find them
set -Ux XDG_DATA_DIRS "$HOME/.nix-profile/share:$XDG_DATA_DIRS"


# Get rid of annoying message
set fish_greeting
# Aliases
alias ff="fastfetch"
alias vim="nvim"

# Path
set -U fish_user_paths $fish_user_paths /home/trent/.cargo/bin /home/trent/Documents/scripts
