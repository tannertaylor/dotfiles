{ ... }: {
  telescope = {
    enable = true;

    extensions.file-browser = {
      enable = true;
      settings.hijack_netrw = true;
    };
  };
}
