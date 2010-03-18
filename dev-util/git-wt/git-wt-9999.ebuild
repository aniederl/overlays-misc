# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EGIT_REPO_URI="git://gitorious.org/willgit/mainline.git"
inherit ruby git
SRC_URI=""


DESCRIPTION="William's Miscellaneous Git Tools (including git-wtf)"
HOMEPAGE="http://git-wt-commit.rubyforge.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-vcs/git"
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	for prog in git-{publish-branch,rank-contributors,show-merges,wtf} ; do
		dobin bin/${prog}
	done

	einfo "Add the following to your gitconfig for having colored output with this package:"
	einfo ""
	einfo "[color]"
	einfo "  ui = auto"
}
