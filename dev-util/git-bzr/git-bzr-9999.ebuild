# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git

EGIT_REPO_URI="git://github.com/kfish/${PN}.git"

DESCRIPTION="a bidirectional git - bazaar gateway"
HOMEPAGE="http://github.com/kfish/git-bzr"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
         dev-util/bzr-fastimport"

src_install() {
	dodoc README
	dobin ${PN}
}
