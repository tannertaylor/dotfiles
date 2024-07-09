{ ... }: {
    programs.tmux = {
        enable = true;
        prefix = "C-t";

        extraConfig = ''
            # Change pane split key binds.
            unbind '"'
            unbind %
            bind | split-window -h
            bind - split-window -v

            # Vim-like pane switching
            bind h select-pane -L
            bind j select-pane -D
            bind k select-pane -U
            bind l select-pane -R

            # Key bind to reload config
            bind r source-file ~/.tmux.conf

            # Change status bar
            set-option -g status-position top
            set-option -g status-style bg=#121212
        '';
    };
}
