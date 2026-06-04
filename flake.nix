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
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      sops-nix,
      nix-vscode-extensions,
      mac-app-util,
    }:
    let
      vscodeOverlay = nix-vscode-extensions.overlays.default;
    in
    {
      darwinConfigurations."nemestos-macbook" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/mac/default.nix
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            nixpkgs.overlays = [ vscodeOverlay ];
            nixpkgs.config.allowUnfree = true;
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.nemestos = import ./home/darwin.nix;
              sharedModules = [
                mac-app-util.homeManagerModules.default
              ];
            };
          }
        ];
      };

      nixosConfigurations."nemestos-nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos/default.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [ vscodeOverlay ];
            nixpkgs.config.allowUnfree = true;
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.nemestos = import ./home/linux.nix;
            };
          }
        ];
      };
    };
}
