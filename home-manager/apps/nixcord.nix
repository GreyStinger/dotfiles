{ ... }:

{
  programs.nixcord = {
    enable = true;
    discord = {
      enable = true;
      vencord.enable = true;
      openASAR.enable = false;
    };
    config = {
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
      ];
      frameless = true;
      disableMinSize = true;
      plugins = {
        disableCallIdle.enable = true;
        imageLink.enable = true;
        moreKaomoji.enable = true;
        moreCommands.enable = true;
        noTypingAnimation.enable = true;
        showHiddenChannels = {
          enable = true;
          showMode = "muted";
        };
        voiceMessages.enable = true;
        noRPC.enable = true;
        betterUploadButton.enable = false;
        callTimer.enable = false;
        fakeNitro.enable = false;
        fixSpotifyEmbeds.enable = false;
        imageZoom.enable = false;
        petpet.enable = false;
        silentTyping.enable = true;
        startupTimings.enable = false;
        whoReacted.enable = false;
      };
    };
    extraConfig = { };
  };
}

