{ mkYarnPackage, fetchFromGitHub }:

mkYarnPackage {
  name = "marp-cli";
  version = "3.4.0";
  src = fetchFromGitHub {
    owner = "marp-team";
    repo = "marp-cli";
    rev = "v3.4.0";
    sha256 = "azscuPkQ9/xcQtBg+5pJigXSQQVtBGvbd7ZwiLwU7Qo=";
  };
  buildPhase = ''
    export HOME=$(mktemp -d)
    yarn --offline build
  '';
}
