{
  description = "NixOS dev environment";

  outputs = { self, nixpkgs }@attrs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        ec2 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = attrs // { inherit pkgs; };
          modules = [
            ./nix/login.nix
            ./nix/aws.nix
          ];
        };
      };
    };
}
