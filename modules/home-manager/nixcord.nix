{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
	enable = true;
        vesktop.enable = true;
	
	#Theming
	quickCss = "@import url(https://codeberg.org/ridge/Discord-Adblock/raw/branch/main/discord-adblock.css);";
        config = {
     	 useQuickCss = true;

	
	#enabledThemes = [
	#	"noctalia-material.theme.css"
	#];
 
	plugins = {
	 anonymiseFileNames.enable = true;
	 betterGifPicker.enable = true;
	 betterSessions.enable = true;
	 BlurNSFW.enable = true;
	 biggerStreamPreview.enable = true;
	 callTimer.enable = true;
         dearrow.enable = true;
	 fakeNitro.enable = true;
	 imageZoom.enable = true;
	 memberCount.enable = true;
	 mentionAvatars.enable = true;
	 messageLogger = {
		enable = true;
		ignoreSelf = true;
	 };
	 serverInfo.enable = true;
	 typingIndicator.enable = true;
	 viewIcons.enable = true;
	 whoReacted.enable = true;
	 youtubeAdblock.enable = true;
 	 crashHandler.enable = true;
	 webKeybinds.enable = true;
	 webScreenShareFixes.enable = true;
	
    };
  };        
};
}