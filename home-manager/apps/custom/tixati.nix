{ stdenv, fetchurl, autoPatchelfHook, zlib, dbus, glib, gtk3, pango, gdk-pixbuf
, dbus-glib, cairo }:

let ver = "3.29-1";
in stdenv.mkDerivation rec {
  pname = "tixati";
  version = ver;
  src = fetchurl {
    url =
      "https://download2.tixati.com/download/tixati-${ver}.x86_64.manualinstall.tar.gz";
    hash = "sha256-sOdgwa6jED1RH1R8b/VWvFjHtXAreWzP+NqVvhbm+zw";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ zlib dbus glib gtk3 pango gdk-pixbuf dbus-glib cairo ];

  sourceRoot = ".";

  unpackPhase = ''
    tar xzf $src --strip-components=1
  '';

  installPhase = ''
    ls -la
    install -m755 -D tixati $out/bin/tixati
  '';
}

