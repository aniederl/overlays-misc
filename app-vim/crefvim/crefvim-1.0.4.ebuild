# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

#VIM_PLUGIN_VIM_VERSION="7.0"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=3666 -> ${P}.zip"
inherit vim-plugin1

DESCRIPTION="vim plugin: a C-reference manual especially designed for Vim"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=614"
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""

S="${WORKDIR}/${PN}"

VIM_PLUGIN_HELPFILES="crefvimdoc"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

src_prepare() {
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
