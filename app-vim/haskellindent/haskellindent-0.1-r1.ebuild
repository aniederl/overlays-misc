# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

VIM_PLUGIN_VIM_VERSION="7.0"
EAPI=2
inherit vim-plugin

DESCRIPTION="vim plugin: Indent settings and filetype detection for Haskell sources"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1968"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=7407 -> haskell.vim"
RESTRICT="mirror"

LICENSE="public-domain"
SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

VIM_PLUGIN_HELPTEXT=\
"This plugin provides indent settings and filetype detection for Haskell
sources.

You can modify the Vim variable 'haskell_indent_case' to change the
indentation for Haskell's 'case' keyword (default is 5 spaces) and
'haskell_indent_if' for the 'if' keyword (default is 3 spaces).

Example vimrc:
\    let haskell_indent_case=4
\    let haskell_indent_if=2"
VIM_PLUGIN_MESSAGES="filetype"

S="${WORKDIR}"
src_unpack() {
	mkdir indent
	# wget doesn't map the URI to filename correctly.
	cp "${DISTDIR}"/haskell.vim indent/

	mkdir ftdetect
	echo "au BufNewFile,BufRead *.hs set filetype=haskell" > ftdetect/haskell.vim
}
