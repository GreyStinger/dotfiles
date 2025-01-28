{ stdenv, fetchurl, autoPatchelfHook, zlib, dbus, glib, gtk3, pango, gdk-pixbuf
, dbus-glib, cairo, lib }:

stdenv.mkDerivation rec {
  pname = "fopnu";
  version = "1.67-1";
  src = fetchurl {
    url =
      "https://download2.fopnu.com/download/fopnu-${version}.x86_64.manualinstall.tar.gz";
    hash = "sha256-O8wmf+/moIZlxZfqozftWEABQR0qPbw41erCxfmV3Mc";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ zlib dbus glib gtk3 pango gdk-pixbuf dbus-glib cairo ];

  sourceRoot = ".";

  unpackPhase = ''
    tar xzf $src --strip-components=1
  '';

  installPhase = ''
    ls -la
    install -m755 -D fopnu $out/bin/fopnu
  '';
}

