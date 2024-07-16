{ ... }: {
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        ratio = [ 0 8 0 ];
      };
    };
  };
}
