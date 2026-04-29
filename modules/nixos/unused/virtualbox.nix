{
  config,
  pkgs,
  inputs,
  ...
}:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "kevin" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;

}
