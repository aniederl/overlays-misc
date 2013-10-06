# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

EGIT_REPO_URI="https://github.com/greenrd/topgit.git"
inherit git-2 bash-completion
SRC_URI=""


DESCRIPTION="TopGit - A different patch queue manager"
HOMEPAGE="http://kerneltrap.org/mailarchive/git/2008/8/3/2795494"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bash-completion"

DEPEND="dev-vcs/git"
RDEPEND="${DEPEND}"

src_compile() {
	emake prefix="/usr" all || die "all"
}

src_install() {
	emake prefix="${D}usr" install || die "install"
	dobashcompletion contrib/tg-completion.bash ${PN}
}
