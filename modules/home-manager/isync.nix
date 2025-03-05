{ ... }: {
  programs.mbsync = {
    enable = true;

    extraConfig = ''
      IMAPStore gmail-kleis-remote
      Host imap.gmail.com
      TLSType IMAPS
      AuthMechs LOGIN
      User afontaine@kleis.ch
      PassCmd "source ~/.bws/config.sh && bws secret get dac50982-40e3-40bc-a28e-b29700f9ad02 | jq -r '.value'"

      MaildirStore gmail-kleis-local
      Path ~/.mail/kleis/
      Inbox ~/.mail/kleis/INBOX
      Subfolders Verbatim

      Channel kleis
      Far :gmail-kleis-remote:
      Near :gmail-kleis-local:
      Create Both
      Expunge Both
      Patterns * !"[Gmail]/All Mail" !"[Gmail]/Important" !"[Gmail]/Starred" !"[Gmail]/Bin"
      SyncState *
    '';
  };
}
