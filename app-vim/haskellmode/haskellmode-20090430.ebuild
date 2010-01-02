# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

VIM_PLUGIN_VIM_VERSION="7.0"

SRC_URI="http://projects.haskell.org/haskellmode-vim/vimfiles/${P}.vba"
inherit vim-plugin1

DESCRIPTION="vim plugin: Provides IDE-like features for Haskell development"
HOMEPAGE="http://projects.haskell.org/haskellmode-vim/"

# doesn't seem to specify a license
LICENSE=""
SLOT=0
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.6[doc]"

S="${WORKDIR}"

VIM_PLUGIN_HELPFILES="haskellmode"
VIM_PLUGIN_MESSAGES="filetype"
VIM_PLUGIN_HELPTEXT=\
"You must set 'g:haddock_browser' to the path of your preferred browser, and
depending on your setup you may also want to change the default value of
'g:haddock_browser_callformat' (see ':help g:haddock_browser_callformat' for
full usage info). You can persist these settings in your vimrc file, for
example:

    let g:haddock_browser=\"/usr/bin/elinks\"
    let g:haddock_browser_callformat=\"%s file://%s >/dev/null 2>&1 &\"

To enable GHC compiler integration, also add the following to your vimrc:

    au BufEnter *.hs compiler ghc

The first time you load haskellmode, you must generate a Haddock index. Do
this with the command:

    :ExportDocIndex

Consult the help documentation for further setup information."
