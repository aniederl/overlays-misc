# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=11648 -> ${P}.vba"
inherit vim-plugin1

DESCRIPTION="vim plugin: Extra highlighting of typedefs, enumerations etc (based on ctags) "
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2646"
LICENSE="vim"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/python"

VIM_PLUGIN_HELPFILES="${PN}"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

S="${WORKDIR}"

src_prepare() {
	# remove windows fu
	rm -rf extra_source/

	# move python script to plugin dir
	mv mktypes.py plugin/
	sed -i '/let s:vrc = globpath(&rtp, "mktypes.py")/ s:mktypes.py:plugin/&:p' \
		plugin/${PN}.vim || die "sed failed"
}
