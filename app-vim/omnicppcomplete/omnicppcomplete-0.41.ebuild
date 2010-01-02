# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=7722 -> ${P}.zip"
inherit vim-plugin1

DESCRIPTION="vim plugin: c code completion plugin"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1520"
LICENSE="vim"
KEYWORDS="~alpha ~amd64 ~ia64 ~mips ~ppc ~sparc ~x86"
IUSE=""

S="${WORKDIR}"

RDEPEND=">=dev-util/ctags-5.7"

VIM_PLUGIN_HELPFILES="omnicppcomplete"
