{
  pkgs,
  rust_pkg,
  ...
}: let
  rust_platform = pkgs.makeRustPlatform {
    cargo = rust_pkg;
    rustc = rust_pkg;
  };
  src = pkgs.fetchFromGitHub {
    owner = "vignesh07";
    repo = "babyshark";
    rev = "41c7f895b0d498faac2a77d82660461d4105ea22";
    hash = "sha256-/AhNIq2+sJYtb2edsIKw4sgUI7Mi9ZY90Ku/ccTNQuc=";
  };
in
  rust_platform.buildRustPackage {
    name = "babyshark";
    src = "${src}/rust";
    cargoHash = "sha256-j9sX8KYCSIKNvBIS3BI6w728kYAzC7JdmgxT8ZJ3eyw=";
    buildInputs = [];
    nativeBuildInputs = [pkgs.pkg-config];
  }
