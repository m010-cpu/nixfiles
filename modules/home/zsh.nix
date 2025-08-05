{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cd = "z";
      ls = "eza --icons=always";
      ll = "eza -alh --icons=always";
      tree = "eza --icons=always --tree";
      lgit = "lazygit";
      update = "sudo nixos-rebuild switch --flake /home/mo/nixfiles";
    };

    history = {
      size = 10000;
      extended = true;
      ignoreAllDups = true;
      share = true;
    };

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "/share/fzf-tab/fzf-tab.plugin.zsh";
      }
      {
        name = "nix-shell";
        src = pkgs.zsh-nix-shell;
        file = "/share/zsh-nix-shell/nix-shell.plugin.zsh";
      }
    ];

    initContent = ''
      # Completions

      zstyle ':completion:*:git-checkout:*' sort false
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always $realpath'
      zstyle ':fzf-tab:complete:ls:*' fzf-preview 'eza -1 --icons --color=always $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --icons --color=always $realpath'

      cal -3
    '';
  };

  programs.eza = {
    enable = true;
  };

  programs.lazygit = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  # programs.zellij = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };
}
