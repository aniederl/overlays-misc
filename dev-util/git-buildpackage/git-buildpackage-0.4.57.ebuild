# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="Suite to help with Debian packages in Git repositories"
HOMEPAGE="http://packages.qa.debian.org/git-buildpackage"
SRC_URI="mirror://debian/pool/main/g/${PN}/${PN}_${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+doc +examples"

CDEPEND="dev-util/devscripts
         dev-util/git
         dev-python/python-dateutil"
DEPEND="${CDEPEND}
        doc? (
            app-text/docbook-sgml-utils
            dev-util/gtk-doc
        )"
RDEPEND="${CDEPEND}"

RESTRICT="mirror"


src_compile() {
	distutils_src_compile

	if use doc ; then
		for doc in docs/man.*.sgml ; do
			docbook2man -o docs/ "${doc}" || die "docbook2man failed"
		done

		local html_dir="docs/manual-html"
		mkdir "${html_dir}"
		echo "gbp_version=${PV}" > docs/version.ent
		docbook2html -o "${html_dir}"/ docs/manual.sgml
		cp /usr/share/gtk-doc/data/*.png "${html_dir}"/ || die "cp failed"
	fi
}

src_install() {
	distutils_src_install

	if use doc ; then
		doman docs/*.1

		dohtml docs/manual-html/*
	fi

	if use examples ; then
		docinto examples
		dodoc examples/*
	fi
}
