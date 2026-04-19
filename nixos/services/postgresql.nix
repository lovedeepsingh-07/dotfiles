{pkgs, ...}: let
  data_dir = "/var/lib/postgresql/filing_cabinet";
in {
  systemd.tmpfiles.rules = [
    "d ${data_dir} 0700 postgres postgres -"
  ];
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    dataDir = data_dir;
    authentication = pkgs.lib.mkOverride 10 ''
      local all all trust
      host all all 127.0.0.1/32 scram-sha-256
      host all all ::1/128 scram-sha-256
    '';
  };
}
