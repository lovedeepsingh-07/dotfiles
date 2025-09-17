default:
	just -l

update:
	home-manager switch --flake .#axew

clean:
	nix-collect-garbage -d
