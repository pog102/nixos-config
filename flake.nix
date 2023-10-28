{

  description = "flae";

  inputs = {

nixpkgs.url = "nixpkgs/nixos-unstable";
  # nixpkgs.url = "nixpkgs/nixos-23.05";
  # nixpkgs.url = "nixpkgs/nixos-unstable"; 
  firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  home-manager = {
          url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

  };
  };
  outputs = { self, nixpkgs, ... }@inputs:
  let 
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };
  in {
  nixosConfigurations = {
  
  epicOs = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs system; };
  modules = [ 
  ./configuration.nix
  ];

      };
    };
  };

}

