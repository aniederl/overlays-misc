# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Make gvim-only colorschemes work transparently in terminal vim"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2390"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=10336 -> ${P}.zip"
LICENSE=""
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES="CSApprox"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

DEPEND="app-arch/unzip"

S="${WORKDIR}"
src_unpack() {
	unzip "${DISTDIR}"/${P}.zip
}
