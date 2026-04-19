{...}: {
  programs.nixvim = {
    plugins.molten = {
      enable = true;
      settings = {};
    };
    extraPython3Packages = ps:
      with ps; [
        requests
        websocket-client
        cairosvg
        pnglatex
        plotly
        nbformat
        pillow
      ];
  };
}
