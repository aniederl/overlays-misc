# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=10872 -> ${P}.vim"
VCDIR="autoload"
inherit vim-plugin1

DESCRIPTION="vim plugin: Python Omni Completion "
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1542"
LICENSE=""
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="|| ( app-editors/vim[python] app-editors/gvim[python] )"

S="${WORKDIR}"

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""
