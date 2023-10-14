{...}: {
  programs.k9s = {
    enable = true;
    settings = {
      k9s = {
        enableMouse = true;
      };
    };
  };
}
