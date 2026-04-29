{
  config,
  pkgs,
  inputs,
  ...
}:

{
 programs.git = {
    enable = true;
    settings = {
      user = {
        name = "cnix56";
        email = "268737461+cnix56@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };
}
