{
  description = "Description for the project";

  inputs = {
    ## nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  
    nixpkgs.url = "github:nix-ocaml/nix-overlays";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        devShells = {
	        default = pkgs.mkShell {
	          buildInputs = [ pkgs.ocamlPackages.utop ];
	          inputsFrom = [ self'.packages.default ];
	        };
	      };	
	      packages = {
	        default = pkgs.ocamlPackages.buildDunePackage {
	          pname = "hello_world";
	          src = ./.;
	          version = "0.0.1-alpha-stealth-mode";
            buildInputs = with pkgs.ocamlPackages; [lwt_ppx dream ppx_deriving_yojson];
	        };
	      };
      };
    };
}
