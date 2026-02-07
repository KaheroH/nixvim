{pkgs, ...}: {
  config = {
    extraConfigLuaPre = '''';

    clipboard = {
      providers.wl-copy.enable = pkgs.stdenv.isLinux;
    };

    opts = {
      # Show line number
      number = true;

      # Show relative line number
      relativenumber = true;

      # Use system clipboard
      clipboard = "unnamedplus";

      # Tabs
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      showtabline = 4;
      expandtab = true;
      smartindent = true;
      breakindent = true;

      # Highlight the screen line of the cursor
      cursorline = true;

      # Set minimum number of lines below the cursor
      scrolloff = 8;

      # Folding
      foldmethod = "manual";
      foldenable = false;

      # Wrap long lines at a character in 'breakat'
      linebreak = true;

      # Disable spell checking
      spell = false;

      swapfile = true;

      # Time (in milliseconds) to wait for a mapped sequence to complete
      timeoutlen = 300;

      # Enable 24-bit RGB color
      termguicolors = true;

      # Don't show mode in the command line
      showmode = false;

      # Open new split below the current window
      splitbelow = true;

      # Keep the screen when splitting
      splitkeep = "screen";

      # Open new split to the right of the current window
      splitright = true;

      # Hide command line unless needed
      cmdheight = 0;

      # Remove EOB
      fillchars.eob = " ";
    };
  };
}
