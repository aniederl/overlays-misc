# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=11834 -> ${P}.zip"
inherit vim-plugin1

DESCRIPTION="vim plugin: A tree explorer plugin for navigating the filesystem"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1658"
LICENSE="WTFPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"

VIM_PLUGIN_HELPFILES="NERD_tree.txt"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

