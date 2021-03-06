# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Icons for Notify-OSD in Ubuntu style "
HOMEPAGE="https://launchpad.net/notify-osd"
SRC_URI="mirror://ubuntu/pool/main/n/${PN}/${PN}_${PV}.tar.gz"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="
	>=x11-misc/icon-naming-utils-0.8.90
	media-gfx/imagemagick
	>=gnome-base/librsvg-2.26.0
	x11-misc/notify-osd"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-util/intltool
	sys-devel/gettext"

RESTRICT="binchecks mirror strip"

S="${WORKDIR}/${PN}"
src_install() {
	emake install DESTDIR="${D}" TARGET_DIR=/usr/share/notify-osd/icons/hicolor  || die "Install failed"
	dodoc debian/{copyright,changelog} AUTHORS || die "Install doc failed"
}
