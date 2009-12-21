# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit bzr distutils

EBZR_REPO_URI="lp:${PN}"

DESCRIPTION="Backend for fast Bazaar data importers"
HOMEPAGE="https://launchpad.net/bzr-fastimport"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"

src_unpack() {
	bzr_src_unpack
}
