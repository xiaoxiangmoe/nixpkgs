{
  lib,
  buildGoModule,
  fetchFromGitHub,
  versionCheckHook,
}:

buildGoModule (finalAttrs: {
  pname = "wait4x";
  version = "3.3.1";

  src = fetchFromGitHub {
    owner = "wait4x";
    repo = "wait4x";
    tag = "v${finalAttrs.version}";
    hash = "sha256-3s+ug4KqFv1P55eqNfAB2jbSPVzySxlHmkDMuuVlJcQ=";
  };

  vendorHash = "sha256-dN7R2d7roA6H9wIz2sBaWctD8K6M8nbQbwPc3t/7rlk=";

  # Tests make network access
  doCheck = false;

  nativeInstallCheckInputs = [
    versionCheckHook
  ];
  versionCheckProgramArg = "version";
  doInstallCheck = true;

  meta = with lib; {
    description = "Wait4X allows you to wait for a port or a service to enter the requested state";
    homepage = "https://github.com/wait4x/wait4x";
    changelog = "https://github.com/wait4x/wait4x/releases/tag/v${finalAttrs.version}";
    license = licenses.asl20;
    maintainers = with maintainers; [
      xiaoxiangmoe
      jfvillablanca
    ];
    mainProgram = "wait4x";
  };
})
