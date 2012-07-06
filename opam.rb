require 'formula'

class Opam < Formula
  url 'https://github.com/OCamlPro/opam/tarball/0.2'
  homepage 'https://github.com/OCamlPro/opam'
  md5 '3f08c3ee397c2ccd42e6d15533bdf958'

  head 'https://github.com/OCamlPro/opam.git'
  depends_on 'objective-caml'

  def install
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "make"
    bin.mkdir
    system "make", "BIN=#{prefix}/bin", "install"
  end
end
