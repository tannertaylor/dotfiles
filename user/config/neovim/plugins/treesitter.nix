{ ... }: {
  treesitter = {
    enable = true;
    ensureInstalled = [
      "nix"
      "c_sharp"
      "bash"
      "rust"
      "hcl"
    ];
  };
}
