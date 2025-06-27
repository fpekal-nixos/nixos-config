let
	authorizedKeysList =
	map (x: x.publicKey) (builtins.attrValues (import ./ssh-keys.nix));
in
{
	users.users.filip.openssh.authorizedKeys.keys = authorizedKeysList;
}
