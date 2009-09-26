# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="scripts to make the life of a Debian Package maintainer easier"
HOMEPAGE="http://packages.qa.debian.org/devscripts"
SRC_URI="mirror://debian/pool/main/d/${PN}/${PN}_${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="bash-completion +doc +examples"

DEPEND="app-arch/dpkg
        dev-lang/perl
        dev-perl/TimeDate
        dev-perl/File-DesktopEntry
        dev-perl/URI
        dev-perl/libwww-perl
        bash-completion? ( app-shells/bash-completion )
        doc? (
            app-text/po4a
            dev-libs/libxslt
        )"
RDEPEND="${DEPEND}"

src_prepare() {
	if ! use doc ; then
		sed -i '/^all:/ s:\$(GEN_MAN1S)::' scripts/Makefile || die "sed failed"
	fi

	if ! use bash-completion ; then
		sed -i '/cp \$(COMPLETION)/ d' scripts/Makefile || die "sed failed"
	fi

	# install examples the gentoo way
	sed -i '/cp \$(EXAMPLES)/ d' Makefile || die "sed failed"

	# remove translated manpages for now
	sed -i '/^all:/ s:translated_manpages::' Makefile || die "sed failed"

	# fix docbook stylesheet paths
	sed -i 's:\(/usr/share/sgml/docbook\)/stylesheet/xsl/nwalsh/:\1/xsl-stylesheets/:' \
		scripts/deb-reversion.dbk \
		scripts/Makefile || die "sed failed"

	# scripts target should be made in src_compile
	echo '.PHONY: scripts' >> Makefile || die "appending .PHONY declaration failed"

	# scripts target depends on version target
	sed -i 's@^scripts:@& version@' Makefile
}

src_install() {
	dodir /usr/bin
	dodir /usr/lib/"${PN}"
	dodir /usr/share/"${PN}"
	use bash-completion && dodir /etc/bash_completion.d

	emake DESTDIR="${D}" install || die "emake install failed"


	doman scripts/*.[15]

	dodoc README*

	if use examples ; then
		docinto examples
		dodoc examples/*
	fi
}
