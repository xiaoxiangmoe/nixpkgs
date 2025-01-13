{
  lib,
  fetchFromGitHub,
  rustPlatform,
  versionCheckHook,

  openssl,
  pkg-config,
}:

rustPlatform.buildRustPackage rec {
  pname = "rattler-build";
  version = "0.34.1";

  src = fetchFromGitHub {
    owner = "prefix-dev";
    repo = "rattler-build";
    rev = "refs/tags/v${version}";
    hash = "sha256-HDRQveWOJKGBWxN7ZyIECo1HBfz+vSaLW7ueSok+d64=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-b44bL/xVUwBdqwr/jawZbyV+yHsGR3hREm4nvHDMCWA=";

  doCheck = false; # test requires network access

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ];

  doInstallCheck = true;

  nativeInstallCheckInputs = [
    versionCheckHook
  ];

  versionCheckProgramArg = [ "-V" ];

  meta = {
    description = "Universal package builder for Windows, macOS and Linux";
    homepage = "https://github.com/prefix-dev/rattler-build";
    changelog = "https://github.com/prefix-dev/rattler-build/releases/tag/v${version}";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [
      genga898
      xiaoxiangmoe
    ];
    mainProgram = "rattler-build";
  };
}
