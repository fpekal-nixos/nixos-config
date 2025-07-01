{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

		nixosBlankSystem.url = "github:fpekal-nixos/nixos-template";
		nixosBlankSystem.inputs.nixpkgs.follows = "nixpkgs";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		sops-nix = {
			url = "github:Mic92/sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		zen-browser = {
			url = "github:youwen5/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		impurity.url = "github:outfoxxed/impurity.nix";
		impermanence.url = "github:nix-community/impermanence";
		boomer.url = "github:nilp0inter/boomer";
	};

	outputs =
		{ self, nixosBlankSystem, home-manager, sops-nix, impurity, ... }@inputs:
		{
			systems.generic = nixosBlankSystem.systems.minimal.extend {
				modules = [
					./default.nix
					home-manager.nixosModules.home-manager
					sops-nix.nixosModules.sops

					{
						imports = [ impurity.nixosModules.impurity ];
					}
				];

				specialArgs = {
					inherit inputs;
				};
			};
			
			systems.everest = self.systems.generic.extend {
				specialArgs = { host = "everest"; };
			};

			systems.table = self.systems.generic.extend {
				specialArgs = { host = "table"; };
			};

			nixosConfigurations.everest = self.systems.everest.mksystem {
				system = "x86_64-linux";
				specialArgs = { users = [ "filip" ]; };

				modules = [
					{
						impurity.enable = false;
						impurity.configRoot = self;

						virtualisation.vmVariant.virtualisation = {
							sharedDirectories = {
								nixos-config = {
									source = "/home/filip/dev/nix/configuration";
									target = "/home/filip/dev/nix/configuration";
								};
							};
						};
					}
				];
			};

			nixosConfigurations.table = self.systems.table.mksystem {
				system = "x86_64-linux";
				specialArgs = { users = [ "filip" ]; };

				modules = [
					{
						impurity.enable = false;
						impurity.configRoot = self;
					}
				];
			};
		};
}

