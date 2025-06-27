{ pkgs, ... }:
{
	programs.nix-ld = {
		enable = true;
		libraries = with pkgs; [
			xorg.libXtst
			xorg.libSM
			xorg.libXext
			fontconfig
			freetype
			xorg.libXrandr
			xorg.libXrender
			xorg.libSM
			xorg.libICE
			openssl
			xorg.libX11
			xorg.libXcursor
			xorg.libxcb
			xorg.libXi
			libxkbcommon
			libz
			libGL libGLU
			pulseaudio
			gtk3
			pango
			harfbuzz
			atk
			cairo
			gdk-pixbuf
			glib
			xorg.libXfixes
			alsa-lib
			libpng
			libjpeg
			libjpeg8
		];
	};
}
