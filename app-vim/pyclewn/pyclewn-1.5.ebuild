# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils vim-doc

DESCRIPTION="A debugger frontend for gvim written in python"
HOMEPAGE="http://pyclewn.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RESTRICT="mirror"
DEPEND="|| ( >=app-editors/vim-7.3 >=app-editors/gvim-7.0[netbeans] )"
RDEPEND="${DEPEND}
         sys-devel/gdb"

src_prepare() {
	distutils_src_prepare
	sed -i -e '/^\s*build_vimhelp()/ d' \
		"${S}"/pyclewn_install.py || die "sed failed"
	sed -i -e '/^\s*pyclewn_install\.build_vimhelp()/ d' \
		"${S}"/setup.py || die "sed failed"
}

pkg_postinst() {
	update_vim_helptags
	distutils_pkg_postinst
}
