# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Minimalistic Murmur (Mumble server)"
HOMEPAGE="http://code.google.com/p/umurmur/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="polarssl"

DEPEND="dev-libs/protobuf-c
	dev-libs/libconfig
	polarssl? ( net-libs/polarssl )
	!polarssl? ( dev-libs/openssl )"

RDEPEND="${DEPEND}"


pkg_setup() {
	enewgroup umurmur
	enewuser umurmur "" "" "" umurmur
}

src_configure() {
	local myconf

	# build uses polarssl by default
	use polarssl || myconf="${myconf} --with-ssl=openssl"

	econf ${myconf}
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	newinitd "${FILESDIR}/umurmurd.initd" umurmurd || die
	newconfd "${FILESDIR}/umurmurd.confd" umurmurd || die

	dodoc AUTHORS ChangeLog README.md || die "dodoc failed"

	# Some permissions are adjusted as the config may contain a server
	# password, and /etc/umurmur will typically contain the cert and the key
	# used to sign it, which are read after priveleges are dropped.
	insinto /etc
	doins "${FILESDIR}/umurmur.conf" || die
	fperms 0640 /etc/umurmur.conf

	dodir /etc/umurmur || die
	fperms 0750 /etc/umurmur
	fowners root:umurmur /etc/umurmur
}

pkg_postinst() {
	elog "A configuration file has been installed at /etc/umurmur.conf - you may "
	elog "want to review it. See also http://code.google.com/p/umurmur/wiki/Configuring02x"

	if use polarssl ; then
		elog
		elog "Because you have enabled PolarSSL support, umurmurd will use a"
		elog "predefined test-certificate and key if none are configured, which"
		elog "is insecure. See http://code.google.com/p/umurmur/wiki/Installing02x#Installing_uMurmur_with_PolarSSL_support"
		elog "for more information on how to create your certificate and key"
	fi
}

