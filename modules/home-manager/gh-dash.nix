{ ... }: {

  programs.gh-dash = {
    enable = true;
    settings = {
      prSections = [
        {
          title = "My Pull Requests";
          filters = "is:pr is:open author:@me";
        }
        {
          title = "Needs my review";
          filters = "is:pr is:open review-requested:@me";
        }
      ];
    };
  };

}
