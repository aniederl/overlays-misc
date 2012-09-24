# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

EGIT_REPO_URI="git://github.com/hanwen/${PN}.git"
EGIT_SOURCEDIR="${WORKDIR}/${PN}"
S="${EGIT_SOURCEDIR}"

DESCRIPTION="Mount MTP devices over FUSE"
HOMEPAGE="https://github.com/hanwen/go-mtpfs"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/go
        media-libs/libmtp
        sys-fs/go-fuse"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's@github.com/[a-zA-Z0-9]*/@@' $(find "${S}" -name '*.go')
}

src_compile() {
	go build || die "compile failed"
}

src_install() {
	export GOBIN="${D}/usr/bin"
	go install || die "install failed"

	dodoc README
}
