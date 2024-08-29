{pkgs, ...}:
with pkgs; let
  projectName = "dev-log";
in
  mkShell {
    name = "${projectName}-shell";
    packages = [go gotools delve tailwindcss templ];
    GOROOT = "${pkgs.go}/share/go";
  }
