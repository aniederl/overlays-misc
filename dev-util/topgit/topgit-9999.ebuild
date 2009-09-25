# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EGIT_REPO_URI="git://repo.or.cz/topgit.git"
inherit git bash-completion
SRC_URI=""


DESCRIPTION="TopGit - A different patch queue manager"
HOMEPAGE="http://kerneltrap.org/mailarchive/git/2008/8/3/2795494"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bash-completion"

DEPEND="dev-util/git"
RDEPEND="${DEPEND}"

src_compile() {
	emake prefix="/usr" all || die "all"
}

src_install() {
	emake prefix="${D}usr" install || die "install"
	dobashcompletion contrib/tg-completion.bash ${PN}
}
