class Fuego < Formula
  desc "Collection of C++ libraries for the game of Go"
  homepage "https://fuego.sourceforge.io/"
  url "http://svn.code.sf.net/p/fuego/code/trunk", :revision => 1981
  version "1.1.SVN"

  head "https://svn.code.sf.net/p/fuego/code/trunk"

  bottle do
    sha256 "0d3274bc3c26894df8b01725486b3c8a66a33dc47e057974bb56b96b64165ab0" => :sierra
    sha256 "0f4eb59a935afffcd4a518d6d04751566ea712ec49906e1bdeea0be194883cde" => :el_capitan
    sha256 "1089ca13694e6774aaeef91ae23e2633b94420c154a9b94e1a45ae281bda3bee" => :yosemite
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "boost"

  def install
    system "autoreconf", "-fvi"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--with-boost=#{Formula["boost"].opt_prefix}"
    system "make", "install"
  end
end
