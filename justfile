default:
	just -l

update-nixos:
	sudo nixos-rebuild switch --flake .#nixos

update-wsl:
	sudo nixos-rebuild switch --flake .#wsl

update-standalone:
	home-manager switch --flake .#standalone

clean:
	nix-collect-garbage -d
