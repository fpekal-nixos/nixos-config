{ pkgs, ... }:
{
	nixpkgs.overlays = [
		(final: prev: {
			ranger = pkgs.stdenv.mkDerivation {
				name = "ranger";
				version = "1.9.3-unstable-2023-08-23";

				buildInputs = [
					prev.ranger
				];

				nativeBuildInputs = [
					final.makeWrapper
				];

				unpackPhase = "true";

				installPhase = ''
					mkdir -p $out/bin
					echo "#!/bin/sh
					${prev.ranger}/bin/ranger" >> $out/bin/ranger
					chmod +x $out/bin/ranger
					wrapProgram $out/bin/ranger --prefix PATH : ${final.lib.makeBinPath (with final; [
						#file

						#libcaca
						#w3m
						#imagemagick
						librsvg
						ffmpeg
						highlight
						p7zip
						unzip
						#poppler_utils
						djvulibre
						#calibre
						mediainfo
						odt2txt
						#python3
						#sqlite
						#jupyter
						fontforge
						openscad
						drawio
					])}
				'';
			};
		})
	];
}
