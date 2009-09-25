# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools

DESCRIPTION="pdf viewer with vim keybindings"
HOMEPAGE="http://code.google.com/p/apvlv/"
SRC_URI="http://apvlv.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.6.0
		>=virtual/poppler-glib-0.5.0[cairo]"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's:^AC_PROG_INSTALL:&\nAC_PROG_LIBTOOL:' configure.ac
	sed -i 's:\(\$prefix\)/man:\1/share/man:'       configure.ac
	sed -i 's:\$(sysconfdir):$(DESTDIR)/&:'         Makefile.am
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc README NEWS AUTHORS THANKS || die
}
