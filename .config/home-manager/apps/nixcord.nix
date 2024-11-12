{ ... }:

{
  programs.nixcord = {
    enable = true;
    discord = {
      enable = true;
      vencord.enable = true;
      openASAR.enable = true;
    };
    config = {
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
      ];
      frameless = true;
      disableMinSize = true;
      plugins = {
        betterUploadButton.enable = true;
        callTimer.enable = true;
        disableCallIdle.enable = true;
        fakeNitro.enable = true;
        fixSpotifyEmbeds.enable = true;
        imageLink.enable = true;
        imageZoom.enable = true;
        moreKaomoji.enable = true;
        moreCommands.enable = true;
        noRPC.enable = true;
        noTypingAnimation.enable = true;
        petpet.enable = true;
        showHiddenChannels = {
          enable = true;
          showMode = "muted";
        };
        silentTyping.enable = true;
        startupTimings.enable = true;
        voiceMessages.enable = true;
        whoReacted.enable = true;
      };
    };
    extraConfig = {};
  };
}

