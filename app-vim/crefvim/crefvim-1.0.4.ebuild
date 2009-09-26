# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#VIM_PLUGIN_VIM_VERSION="7.0"
EAPI=2
inherit vim-plugin

DESCRIPTION="vim plugin: a C-reference manual especially designed for Vim"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=614"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=3666 -> ${P}.zip"
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""

RESTRICT="mirror"


VIM_PLUGIN_HELPFILES="crefvimdoc"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	cd ${S}

	# mapping conflicts with vcscommand
	sed -i 's/<Leader>cc/<Leader>cb/' plugin/${PN}.vim doc/${PN}.txt
}

src_install() {
	mv after "${WORKDIR}"/
	insinto /usr/share/vim/vimfiles/after/syntax/help.vim.d
	newins "${WORKDIR}"/after/syntax/help.vim ${PN}.vim

	vim-plugin_src_install
}

pkg_postint() {
	einfo "Default mapping for CRefVimInvoke has been changed"
	einfo "from <Leader>cc to <Leader>cb to avoid conflict with"
	einfo "app-vim/vcscommand"

	vim-plugin_pkg_postinst
}
