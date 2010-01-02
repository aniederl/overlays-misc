# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

#VIM_PLUGIN_VIM_VERSION="7.0"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=11939 -> ${P}.vba.gz"
inherit vim-plugin1

DESCRIPTION="vim plugin: Syntax highlight for Markdown text files"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2882"
LICENSE=""
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=\
"Put the following into your vimrc file to use this script:
  autocmd BufNewFile,BufRead *.{md,mld,mark,markdown} set filetype=markdown"
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""
