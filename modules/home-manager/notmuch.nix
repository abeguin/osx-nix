{ ... }: {
  programs.notmuch = { enable = true; };
  accounts.email.accounts.afo = {
    address = "afontaine@kleis.ch";
    aerc = {
      enable = true;
      extraAccounts = { source = "maildir://~/.mail/kleis"; };
    };
    notmuch = { enable = true; };
  };
  accounts.email.maildirBasePath = "~/.mail";
}
