# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=7407 -> ${P}.vim"
VCDIR="indent"
inherit vim-plugin1

DESCRIPTION="vim plugin: Indent settings and filetype detection for Haskell sources"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1968"
LICENSE="public-domain"
SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"

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

src_install() {
	mv indent/haskell{indent,}.vim
	vim-plugin_src_install

	insinto /usr/share/vim/vimfiles/ftdetect
	newins "${FILESDIR}"/${PN}-ftdetect.vim haskell.vim
}
