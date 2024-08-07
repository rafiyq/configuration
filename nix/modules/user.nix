{
  programs.aria2 = {
    enable = true;
    settings = {
      continue = true;
      max-connection-per-server = 16;
      min-split-size = "8M";
      retry-wait = 1;
      split = 32;
      ftp-pasv = true;
      max-upload-limit = "1K";
      seed-time = 0;
    };
  };

  programs.helix = {
    defaultEditor = true;
    enable = true;
    settings = {
      editor = {
        true-color = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
      keys.insert = {
        j.k = "normal_mode";
      };
    };
  };

  programs.home-manager.enable = true;
}