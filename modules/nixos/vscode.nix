{
  config,
  pkgs,
  inputs,
  ...
}:

{
environment.systemPackages = with pkgs; [
  (vscode-with-extensions.override {
    vscode = vscodium;
    vscodeExtensions = with vscode-extensions; [
      jnoortheen.nix-ide

    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "dms-theme";
        publisher = "DankLinux";
        version = "0.0.3";
        sha256 = "sha256-MI1x1wiqvwg/N89oMuNVp0qlRT84ubvuMjtpkX0WKQY=";
      }
    ];
  })
];

}
  
