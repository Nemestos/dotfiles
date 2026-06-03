{
  description = "Nix config multi-host";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
    }:
    {
      darwinConfigurations."nemestos-macbook" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/mac/default.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.nemestos = import ./home/default.nix;
            };
          }
        ];
      };
      # ── WSL (à décommenter quand besoin) ──────────────────────────────
      # nixosConfigurations."wsl" = nixpkgs.lib.nixosSystem { ... };
    };
}
