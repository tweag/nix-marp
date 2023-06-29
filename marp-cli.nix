{ mkYarnPackage, fetchFromGitHub }:

mkYarnPackage {
  name = "marp-cli";
  version = "2.3.0";
  src = fetchFromGitHub {
    owner = "marp-team";
    repo = "marp-cli";
    rev = "v2.3.0";
    sha256 = "zk52vYWdPU+U7GIXjoHaVP7ZRXWmVyL/DcOaR2dmfps=";
  };
  buildPhase = ''
    export HOME=$(mktemp -d)
    yarn --offline build
  '';
}
