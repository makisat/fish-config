if status is-interactive
    # Commands to run in interactive sessions can go here
    oh-my-posh init fish --config ~/.config/fish/themes/amro.omp.json | source

    # --- aliases --- #
    # neovim
    alias vi="nvim"

    # --- setups --- #
    # Set up fzf key bindings
    fzf --fish | source

    # --- path --- #
    # tmux
    fish_add_path /home/makisat/.config/fish/scripts
    # go path
    fish_add_path /home/makisat/go/bin

end

function fish_greeting
    neofetch
end
