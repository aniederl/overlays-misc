# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#VIM_PLUGIN_VIM_VERSION="7.0"
EAPI=2
inherit vim-plugin

DESCRIPTION="vim plugin: Fast and Easy Find and Replace Across Multiple Files"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2438"
LICENSE="public-domain"
KEYWORDS="amd64 x86"
IUSE=""

SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=10265 -> ${P}.zip"
DEPEND="${DEPEND} app-arch/unzip"
RESTRICT="mirror"
S="${WORKDIR}"

VIM_PLUGIN_HELPFILES="EasyGrep"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

src_unpack() {
	unpack ${A}
}
