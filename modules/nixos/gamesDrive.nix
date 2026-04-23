{
  config,
  pkgs,
  inputs,
  ...
}:

{
  fileSystems."/mnt/gamedisk" = {
    device = "/dev/disk/by-uuid/B4C2FDE6C2FDAD2C";
    fsType = "ntfs";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "user" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "uid=1000"
      "gid=100"
      "rw"
      "exec"
      "umask=000"

    ];
  };
}
