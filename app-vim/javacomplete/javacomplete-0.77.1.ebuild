# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=7716 -> ${P}.zip"
inherit eutils java-utils-2 vim-plugin1

DESCRIPTION="vim plugin: Omni Completion for JAVA"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1785"
LICENSE="vim"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jdk-1.5.0"

S="${WORKDIR}"

VIM_PLUGIN_HELPFILES="${PN}"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

src_prepare() {
	epatch "${FILESDIR}"/${P}-binary-globbing.patch
}

src_compile() {
	ejavac autoload/Reflection.java
}
