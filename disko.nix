# ata-CT120BX500SSD1_1919E181081A
# ata-CT240BX500SSD1_1932E1924936

{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-id/ata-CT120BX500SSD1_1919E181081A";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umaxk=0077" ];
              };
            };
            SWAP = {
              type = "8200";
              size = "16G";
              content = {
                type = "swap";
                randomEncryption = true;
                resumeDevice = true;
              };
            };
            ZFS = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            };
          };
        };
      };
      data = {
        device = "/dev/disk/by-id/ata-CT240BX500SSD1_1932E1924936";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ZFS = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            };
          };
        };
      };
    };
    zpool = {
      zroot = {
        type = "zpool";
        rootFsOptions = {
          mountpoint = "none";
          compressions = "zstd";
          acltype = "posixacl";
          xattr = "sa";
        };
        options.ashift = "12";
        datasets = {
          "root" = {
            type = "zfs_fs";
            options.encryption = "off";
            mountpoint = "/";
          };
          "root/nix" = {
            type = "zfs_fs";
            options.mountpoint = "/nix";
            mountpoint = "/nix";
          };
          "root/home" = {
            type = "zfs_fs";
            options.mountpoint = "/home";
            mountpoint = "/home";
          };
          "root/data" = {
            type = "zfs_fs";
            options.mountpoint = "/data";
            mountpoint = "/data";
          };
        };
      };
    };
  };
}