# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Delete/change/add parentheses/quotes/XML-tags/much more with ease"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1697"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=8283 -> ${P}.zip"
RESTRICT="mirror"

LICENSE="vim"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"

VIM_PLUGIN_HELPFILES="surround"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

S="${WORKDIR}"
src_unpack() {
	unzip ${A}
	cd "${S}"
}
