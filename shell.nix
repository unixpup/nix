{pkgs, ...}: {
programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions = {
      enable = true;
      strategy = ["completion"];
    };

    zsh-autoenv = {
      enable = true;
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "cursor" "regexp" "root" "line"];
    };

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --upgrade --upgrade-all";
      nixdev = "cd $HOME/.config/nixos";
    };

    ohMyZsh = {
      enable = true;
      plugins = ["git" "direnv" "fzf" "ssh-agent"];
      preLoaded = "zstyle :omz:plugins:ssh-agent agent-forwarding yes";
      theme = "half-life";
    };
  };

  # DirEnv support
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv = {
      enable = true;
    };
  };
}
