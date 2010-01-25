# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils toolchain-funcs

DESCRIPTION="a computer language devoted to elementary plane geometry"
HOMEPAGE="http://www.eukleides.org/"
SRC_URI="http://www.eukleides.org/files/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc linguas_fr"

CDEPEND="app-text/texlive-core
         linguas_fr? ( sys-devel/gettext )
        "
DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
DEPEND="${CDEPEND} ${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-doc.patch"
	sed -i -e "/^DOC_DIR =/ s/${PN}/${PF}/" Config || die "sed failed"

	use linguas_fr || sed -i -e '/^LOCALES/ d' Config || die "sed failed"
	if use doc ; then
		sed -i -e '/^DOC =/ s/info//' Config || die "sed failed"
	else
		sed -i -e '/^DOC =/ d' Config || die "sed failed"
	fi
}

src_compile() {
	use doc && export VARTEXFONTS="${T}/fonts"
	emake CC="$(tc-getCC)"
}

src_install() {
	for instdir in  /usr/bin /usr/share/man/man1 /usr/share/doc/${PF} ; do
		dodir "${instdir}"
	done
	emake install PREFIX="${D}/usr"
}
