{
  globals.mapleader = " ";

  keymaps = [
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "Go to Left Window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<C-n>";
      action = "<C-w>j";
      options = {
        desc = "Go to Lower Window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<C-e>";
      action = "<C-w>k";
      options = {
        desc = "Go to Upper Window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<C-i>";
      action = "<C-w>l";
      options = {
        desc = "Go to Right Window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "n";
      action = "j";
      options = {
        desc = "Move Down";
        remap = false;
      };
    }
    {
      mode = "n";
      key = "e";
      action = "k";
      options = {
        desc = "Move Up";
        remap = false;
      };
    }
    {
      mode = "n";
      key = "i";
      action = "l";
      options = {
        desc = "Move Left";
        remap = false;
      };
    }
    {
      mode = "v";
      key = "n";
      action = "j";
      options = {
        desc = "Move Down";
        remap = false;
      };
    }
    {
      mode = "v";
      key = "e";
      action = "k";
      options = {
        desc = "Move Up";
        remap = false;
      };
    }
    {
      mode = "v";
      key = "i";
      action = "l";
      options = {
        desc = "Move Left";
        remap = false;
      };
    }
  ];
}
