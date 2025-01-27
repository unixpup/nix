{ config, lib, pkgs, ... } : {
	fonts = {
		enableDefaultPackages = true;
		enableGhostscriptFonts = true;
		packages = with pkgs; [
			noto-fonts
			noto-fonts-lgc-plus
			noto-fonts-cjk-sans
			noto-fonts-cjk-serif
			noto-fonts-color-emoji
			liberation_ttf
			roboto
			nerd-fonts.jetbrains-mono
		];
		fontDir = {
			enable = true;
			decompressFonts = true;
		};
		fontconfig = {
			enable = true;
			allowBitmaps = true;
			useEmbeddedBitmaps = true;
			antialias = true;
			subpixel = {
				rgba = "rgb";
			};
			hinting = {
				enable = true;
				style = "full";
			};
			defaultFonts = {
				serif = [ "Liberation Serif" ];
				sansSerif = [ "Liberation Sans" ];
				monospace = [ "JetBrainsMono Nerd Font" ];
				emoji = [ "Noto Color Emoji" ];
			};
		};
	};
}
