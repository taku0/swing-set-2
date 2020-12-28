let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
  fetchurl = pkgs.fetchurl;
in

stdenv.mkDerivation rec {
  version = "11.43.55";
  openjdk = "11.0.9.1";
  platform = "linux";
  pname = "swingset2";

  src = fetchurl {
    url = "https://cdn.azul.com/zulu/bin/zulu${version}-ca-jdk${openjdk}-${platform}_x64.tar.gz";
    sha256 = "6c79bfe8bb06c82b72ef2f293a14becef56b3078d298dc75fda4225cbb2d3d0c";
  };

  nativeBuildInputs = [ pkgs.unzip pkgs.jdk8 ];

  buildPhase = ''
    unzip -d SwingSet2 ./demo/jfc/SwingSet2/src.zip
    cd SwingSet2
    # Recompile it with JDK 8.
    javac *.java
    jar cfe SwingSet2.jar SwingSet2 *.class resources
  '';

  installPhase = ''
    mkdir -p "$out"
    cp ./SwingSet2.jar "$out"/
  '';

  meta = with stdenv.lib; {
    license = licenses.gpl2;
    description = "Java SwingSet2 demo";
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
  };
}
