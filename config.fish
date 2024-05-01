if status is-interactive
    # fish keybindings
    fzf --fish | source
    # fish default command
    set FZF_DEFAULT_COMMAND 'fd --type f'

    # nvim alias
    alias vi="nvim"

    # ls aliases
    alias la="ls -al"

    fish_add_path "$HOME/.config/emacs/bin"
    fish_add_path "$HOME/go/bin"
end

function fish_greeting
    # figlet Hello World
    neofetch
end

function tm
    set dest $argv[1]
    set components (string split -- / $dest)
    set dir_name $components[-1]
    tmux new -s $dir_name -c $dest
end

function tma
    tmux choose-session && tmux a
end

function fish_tmux_fzf_session
    set dir (fd . '/home/makisat/' --type d -H | fzf --reverse)
    if test -z "$dir" 
	return
    end

    set session_name (basename $dir)
    if tmux has-session -t $session_name
	tmux switch-client -t $session_name
    else
	tmux new-session -s $session_name -c $dir
    end
end

# Ctrl-f binding
bind \ch fish_tmux_fzf_session 
# attach to session
bind \ca tma
