require 'formula'

class ModTile < Formula

  homepage 'http://wiki.openstreetmap.org/wiki/Mod_tile'
  head 'http://svn.openstreetmap.org/applications/utils/mod_tile'

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  depends_on "boost"
  depends_on "mapnik"
  depends_on "icu4c"

  def install
    system "./autogen.sh"

    icu4c_prefix = Formula.factory('icu4c').opt_prefix

    args = [
      "--prefix=#{prefix}",
      "--with-apxs=/usr/sbin/apxs",
      "--with-icu=#{icu4_prefix}/bin/icu-config"
    ]

    system "./configure", *args
    system "DESTDIR=/tmp/mod_tile make install"
    system "DESTDIR=/tmp/mod_tile make install-mod_tile"
  end

end
