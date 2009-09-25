# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit vim-plugin

MY_P=${P/-/_}

DESCRIPTION="Integrate Eclipse functionality with Vim"
HOMEPAGE="http://eclim.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.sh"
LICENSE=""
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=virtual/jdk-1.5
		>=dev-util/eclipse-sdk-3.2
		>=app-editors/vim-7
		"
RDEPEND=">=virtual/jre-1.5
		 >=dev-util/eclipse-sdk-3.2
		 "

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

src_unpack() {
	local start=`awk '/^__BEGIN_ARCHIVE__/ { print NR + 1; exit 0; }' ${A}`
	tail -n +$start ${A} | gzip -dc | tar x -C ${S}

	cd "${S}"
	unpack org.${MY_P}.tar.gz
}
