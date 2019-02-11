{ stdenv, fetchFromGitHub, rofi, pkgconfig, cairo, glib, libqalculate, autoreconfHook }:

stdenv.mkDerivation rec {
  name = "rofi-calc-${version}";
  version = "v0.1";

    src = fetchFromGitHub {
      owner = "svenstaro";
      repo = "rofi-calc";
      rev = version;
      sha256 = "0xzwmdsim8p9kq9y41irvqhh92bk9nw5k2yy2fkf5ja5mmlbw5ri";
  };

  buildInputs = [ cairo rofi glib ];
  nativeBuildInputs = [ pkgconfig autoreconfHook ];

  meta = with stdenv.lib; {
    description = "A rofi extension to perform calculations";
    homepage = https://github.com/svenstaro/rofi-calc;
    maintainers = with maintainers; [ asymmetric ];
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
