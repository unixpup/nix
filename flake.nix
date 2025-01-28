{
  description = "boiiii watchu say abt nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    nixosConfigurations.mainframe = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [./hosts/mainframe/default.nix];
    };
  };
}
