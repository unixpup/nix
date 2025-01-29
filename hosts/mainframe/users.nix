{pkgs, ...}: {
  users.users.unix = {
    isNormalUser = true;
    extraGroups = ["users" "wheel" "video" "audio" "input"];
    packages = with pkgs; [
      firefox
      spotify
      vesktop
      fastfetch
      btop-rocm
      gnome-software
      alacritty
      hyperbeam
    ];
    shell = pkgs.zsh;
  };
}
