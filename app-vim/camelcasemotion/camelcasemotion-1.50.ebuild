# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
SRC_URI="http://vim.sourceforge.net/scripts/download_script.php?src_id=10530 -> ${P}.vba.gz"
inherit vim-plugin1

DESCRIPTION="vim plugin: Motion through CamelCaseWords and underscore_notation"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1905"
RESTRICT="mirror"

LICENSE="vim"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"

VIM_PLUGIN_HELPFILES="${PN}"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""
