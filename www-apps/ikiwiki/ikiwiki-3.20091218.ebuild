# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit perl-app

DESCRIPTION="Wiki compiler which converts wiki pages of different format into static HTML pages"
HOMEPAGE="http://ikiwiki.info"
SRC_URI="mirror://debian/pool/main/i/ikiwiki/${P//-/_}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-perl/Text-Markdown
        dev-perl/HTML-Parser
        dev-perl/HTML-Template
        dev-perl/HTML-Scrubber
        dev-perl/CGI-Session
        dev-perl/CGI-FormBuilder
        dev-perl/Mail-Sendmail
        dev-perl/Time-Duration
        dev-perl/TimeDate
        dev-perl/RPC-XML
        dev-perl/URI
        dev-perl/XML-Simple
        dev-perl/XML-Feed
        dev-perl/File-MimeInfo
        dev-perl/Locale-gettext
       "
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_compile() {
	perl-app_src_compile
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
