# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=11852 -> ${P}.zip"
inherit vim-plugin1

DESCRIPTION="vim plugin: buffer/file/command/tag/etc explorer with fuzzy matching"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1984"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"

VIM_PLUGIN_HELPFILES="fuf.txt"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""
