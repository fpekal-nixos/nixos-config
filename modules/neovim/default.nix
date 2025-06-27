{ pkgs, ... }:
{
	programs.neovim = {
		enable = true;
		defaultEditor = true;

		# runtime = {
		# 	# "lua".source = ./lua;
		# };

		# configure = {
		# 	customRC = "lua require(\"init\")";
		# 	packages = with pkgs.vimPlugins; {
		# 		colors = {
		# 			start = [ catppuccin-nvim ];
		# 		};
		# 	};
		# };
	};
}
