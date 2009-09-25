# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#VIM_PLUGIN_VIM_VERSION="7.0"
EAPI=2
inherit vim-plugin

DESCRIPTION="vim plugin: manage sessions with dialogs or the command line"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2010"
LICENSE="GPL"
KEYWORDS="amd64 x86"
IUSE=""

SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=8836 -> ${PN}.vim"
RESTRICT="mirror"
S="${WORKDIR}"

VIM_PLUGIN_HELPFILES="${PN}"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

src_unpack() {
	mkdir plugin
	cp "${DISTDIR}/${A}" plugin/ || die "cp failed"
}
