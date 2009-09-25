# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit vim-plugin

DESCRIPTION="vim plugin: c code completion plugin"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1520"
LICENSE="vim"
KEYWORDS="~alpha ~amd64 ~ia64 ~mips ~ppc ~sparc ~x86"
IUSE=""

SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=7722 -> ${P}.zip"
DEPEND="${DEPEND} app-arch/unzip"
RESTRICT="mirror"
S="${WORKDIR}"

RDEPEND=">=dev-util/ctags-5.7"

VIM_PLUGIN_HELPFILES="omnicppcomplete"
