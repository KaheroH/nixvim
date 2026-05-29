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
        remap = true;
      };
    }
    {
      mode = "n";
      key = "e";
      action = "k";
      options = {
        desc = "Move Up";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "i";
      action = "l";
      options = {
        desc = "Move Left";
        remap = true;
      };
    }


  ];
}
