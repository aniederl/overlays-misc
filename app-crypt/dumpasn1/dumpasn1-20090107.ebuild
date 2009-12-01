# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

DESCRIPTION="ASN.1 object dump/syntax check program"
HOMEPAGE="http://www.cs.auckland.ac.nz/~pgut001/"
SRC_URI="${HOMEPAGE}/${PN}.c ${HOMEPAGE}/${PN}.cfg"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"
src_unpack() {
	cd "${DISTDIR}"/
	cp ${A} "${S}"/

	cd "${S}"/
}

src_compile() {
	$(tc-getCC) -DDEBIAN -o "${PN}" "${PN}.c"
}

src_install() {
	dobin "${PN}"

	insinto /etc/"${PN}"
	doins "${PN}.cfg"

	doman "${FILESDIR}/${PN}.1"
}
