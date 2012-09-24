# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

EGIT_REPO_URI="git://github.com/hanwen/${PN}.git"

DESCRIPTION="Mount MTP devices over FUSE"
HOMEPAGE="https://github.com/hanwen/go-fuse"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's@github.com/[a-zA-Z0-9]*/@@' $(find "${S}" -name '*.go')
}

src_compile() {
	:
}

src_install() {
	pkgdir="/usr/lib/go/src/pkg/${PN}"
	dodir   "${pkgdir}"
	insinto "${pkgdir}"

	doins -r raw fuse splice unionfs zipfs benchmark

	docinto examples
	dodoc -r example/*
}
