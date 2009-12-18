# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: "
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1905"
SRC_URI="http://vim.sourceforge.net/scripts/download_script.php?src_id=10530 -> ${P}.vba.gz"

LICENSE="vim"
KEYWORDS="~amd64 ~x86"
IUSE=""

VIM_PLUGIN_HELPFILES="${PN}"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

vba-extract() {
	local vimball="${1}"
	if ! head -n 1 "${vimball}" | grep -q '^" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.$' ; then
		die "${vimball} does not seem to be a Vimball!"
	fi

	local filelines="$(grep -n '\[\[\[' "${vimball}" | cut -d : -f 1 | tr '\n' ' ')"
	for linenr in ${filelines} ; do
		local filename="$(sed -ne ${linenr}' s:\t\[\[\[1$::p' ${vimball})"
		local filelength="$(sed -ne $((linenr + 1))' p' ${vimball})"
		local filedir="$(dirname ${filename})"

		[[ ! -d "${filedir}" ]] && mkdir -p "${filedir}"

		sed -ne $((linenr + 2)),$((linenr + 2 + filelength - 1))' p' "${vimball}" > "${filename}"
	done
}

S="${WORKDIR}"
src_unpack() {
	cd "${WORKDIR}"
	gunzip -c "${DISTDIR}"/${P}.vba.gz > ${P}.vba
	vba-extract ${P}.vba
}


