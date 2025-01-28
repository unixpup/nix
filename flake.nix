{
  description = "boiiii watchu say abt nixos";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = {
    nixpkgs,
    chaotic,
    ...
  }: {
    nixosConfigurations.mainframe = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/mainframe/default.nix
        chaotic.nixosModules.default
      ];
    };
  };
}
