with import <nixpkgs> { };

stdenv.mkDerivation rec {
  name = "nux-${version}";
  version = "1.4";

  src = lib.cleanSource ./.;

  buildCommand = ''
  mkdir -p $out/bin
  cp $src/nux $out/bin/nux
  chmod +x $out/bin/nux
'';

  meta = with stdenv.lib; {
    description = "Imperative-Declarative alternative to nix-env";
    longDescription = ''
      Used to maintain a set of packages in the user environment, the main
      difference to nix-env is that updates are tracked based on path names
      defined in $NIX_PATH and attribute names instead of the name attribute of
      derivations.  Consequently, the package attributes are the same as the
      ones returned by `nix search` and the NixOS package set.
      Based on the following original code:
      https://gist.github.com/danbst/f07d9760ed15dd844e141177cf7dd478 by danbst.
  '';
    maintainers = [ maintainers.timor ];
    platforms = platforms.all;
    license = licenses.unlicense;
  };
}
