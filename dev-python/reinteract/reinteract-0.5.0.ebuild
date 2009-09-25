# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A system for interactive experimentation with python"
HOMEPAGE="http://fishsoup.net/software/reinteract/"
SRC_URI="http://www.reinteract.org/download/sources/${P}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sound"

DEPEND=""
RDEPEND=">=dev-lang/python-2.5
		 dev-python/pygtk
		 dev-python/numpy
		 dev-python/matplotlib
		 sound? ( media-sound/sox )"

src_install() {
	emake DESTDIR="${D}" install
}
