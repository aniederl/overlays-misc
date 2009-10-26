# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

VIM_PLUGIN_VIM_VERSION="7.0"

EAPI="2"

inherit eutils vim-plugin

DESCRIPTION="vim plugin: Provides IDE-like features for Haskell development"
HOMEPAGE="http://projects.haskell.org/haskellmode-vim/"
SRC_URI="http://projects.haskell.org/haskellmode-vim/vimfiles/${P}.vba"

# doesn't seem to specify a license
LICENSE=""
SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}"
RDEPEND=">=dev-lang/ghc-6.6[doc]"

RESTRICT="mirror"

VIM_PLUGIN_HELPFILES="haskellmode"
VIM_PLUGIN_MESSAGES="filetype"

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
	vba-extract "${DISTDIR}"/${P}.vba
}

pkg_postinst() {
	vim-plugin_pkg_postinst
	elog "You must set 'g:haddock_browser' to the path of your preferred browser, and"
	elog "depending on your setup you may also want to change the default value of"
	elog "'g:haddock_browser_callformat' (see ':help g:haddock_browser_callformat' for"
	elog "full usage info). You can persist these settings in your vimrc file, for"
	elog "example:"
	elog
	elog "    let g:haddock_browser=\"/usr/bin/elinks\""
	elog "    let g:haddock_browser_callformat=\"%s file://%s >/dev/null 2>&1 &\""
	elog
	elog "To enable GHC compiler integration, also add the following to your vimrc:"
	elog
	elog "    au BufEnter *.hs compiler ghc"
	elog
	elog "The first time you load haskellmode, you must generate a Haddock index. Do"
	elog "this with the command:"
	elog
	elog "    :ExportDocIndex"
	elog
	elog "Consult the help documentation for further setup information."
}
