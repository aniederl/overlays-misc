# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: "
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1785"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=7716 -> ${P}.zip"
RESTRICT="mirror"

# none specified
LICENSE=""
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

S="${WORKDIR}"
src_unpack() {
	unzip "${DISTDIR}/${P}.zip"
}

