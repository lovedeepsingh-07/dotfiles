default:
	just -l
update:
	sudo nixos-rebuild switch --flake .#axew
update-hm:
	home-manager switch --flake .#axew
clean:
	nix-collect-garbage -d
