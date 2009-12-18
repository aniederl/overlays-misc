# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Use CTRL-A/X to increment dates, times, and more"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2120"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=9356 -> ${P}.vim"
RESTRICT="mirror"

LICENSE="vim"
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES="${PN}"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

S="${WORKDIR}"
src_unpack() {
	mkdir plugin
	cp "${DISTDIR}/${A}" plugin/ || die "cp failed"
}
