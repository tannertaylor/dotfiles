{ ... }: {
  obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "brain";
          path = "~/brain";
        }
      ];

      notes_subdir = "00-notes";
      new_notes_location = "notes_subdir";
    };
  };
}
