{ stdenv
, fetchurl
, autoPatchelfHook
, zlib
, dbus
, glib
, gtk3
, pango
, gdk-pixbuf
, dbus-glib
, cairo
}:

let
  ver = "1.41";
in
stdenv.mkDerivation rec {
  pname = "darkmx";
  version = ver;
  src = fetchurl {
    url = "https://download.darkmx.app/darkmx-${ver}-linux64.tar.gz";
    hash = "sha256-5TfNAWo8sdocdA1cu7LSSGOEXwvuQTGFeZLGCAMgtuA";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [
    zlib
    dbus
    glib
    gtk3
    pango
    gdk-pixbuf
    dbus-glib
    cairo
  ];

  sourceRoot = ".";

  unpackPhase = ''
    tar xzf $src --strip-components=1
  '';

  installPhase = ''
    ls -la
    install -m755 -D darkmx $out/bin/darkmx
  '';
}

