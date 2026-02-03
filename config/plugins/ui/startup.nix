{
  plugins.startup = {
    enable = true;
    settings = {
      header = {
        title = "Header";
        type = "text";
        oldfilesDirectory = false;
        align = "center";
        foldSection = false;
        margin = 5;
        content = [
          "@@@  @@@  @@@@@@@@   @@@@@@   @@@  @@@  @@@  @@@@@@@@@@ "
          "@@@@ @@@  @@@@@@@@  @@@@@@@@  @@@  @@@  @@@  @@@@@@@@@@@"
          "@@!@!@@@  @@!       @@!  @@@  @@!  @@@  @@!  @@! @@! @@!"
          "!@!!@!@!  !@!       !@!  @!@  !@!  @!@  !@!  !@! !@! !@!"
          "@!@ !!@!  @!!!:!    @!@  !@!  @!@  !@!  !!@  @!! !!@ @!@"
          "!@!  !!!  !!!!!:    !@!  !!!  !@!  !!!  !!!  !@!   ! !@!"
          "!!:  !!!  !!:       !!:  !!!  :!:  !!:  !!:  !!:     !!:"
          ":!:  !:!  :!:       :!:  !:!   ::!!:!   :!:  :!:     :!:"
          " ::   ::   :: ::::  ::::: ::    ::::     ::  :::     :: "
          "::    :   : :: ::    : :  :      :      :     :      :  "
        ];
        highlight = "statement";
        defaultColor = "";
        oldfilesAmount = 0;
      };
      body = {
        title = "Menu";
        type = "mapping";
        oldfilesDirectory = false;
        align = "center";
        foldSection = false;
        margin = 5;
        content = [
          [
            " Find File"
            "Telescope find_files"
            "ff"
          ]
          [
            " Find Word"
            "Telescope live_grep"
            "fr"
          ]
          [
            " Recent Files"
            "Telescope oldfiles"
            "fg"
          ]
          [
            " File Browser"
            "Telescope file_browser"
            "fe"
          ]
        ];
        highlight = "string";
        defaultColor = "";
        oldfilesAmount = 0;
      };
      colors = {
        background = "#ffffff";
        folded_Section = "#ffffff";
      };
      options = {
        paddings = [
          1
          3
        ];
      };
      parts = [
        "header"
        "body"
      ];
    };
  };
}
