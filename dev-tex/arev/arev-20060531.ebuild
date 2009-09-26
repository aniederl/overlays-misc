# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit latex-package

MY_P="${PN}"
S="${WORKDIR}/${MY_P}"
SUPPLIER="public"
DESCRIPTION="LaTeX package for the Arev Sans Type1 font family"
HOMEPAGE="http://www.ctan.org/tex-archive/fonts/arev/"
SRC_URI="http://www.ctan.org/get/fonts/${MY_P}.zip"

LICENSE="BitstreamVera
		 LPPL-1.3a
		 GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="dev-tex/bera
         dev-tex/mathdesign"

RESTRICT="mirror"

src_install() {
	DOCS="${S}/README ${S}/ChangeLog"

	addwrite /var/cache/fonts

	# install sty and fonts
	cd "${S}"/tex/latex/"${MY_P}"
	latex-package_src_install

	# latex-package.eclass isn't intelligent enough for installing .tex files
	# into ${TEXMF}
	insinto "${TEXMF}"/tex/latex/"${PN}"
	doins "${S}"/tex/latex/"${MY_P}"/*.tex

	cd "${S}"/fonts/afm/public/"${MY_P}"
	latex-package_src_install

	cd "${S}"/fonts/tfm/public/"${MY_P}"
	latex-package_src_install

	cd "${S}"/fonts/type1/public/"${MY_P}"
	latex-package_src_install

	cd "${S}"/fonts/vf/public/"${MY_P}"
	latex-package_src_install

	cd "${S}"/doc/fonts/"${MY_P}"
	latex-package_src_install pdf

	# FIXME: figure out how to correctly install *.enc files

	# install map
	insinto "${TEXMF}"/fonts/map/dvips/"${MY_P}"
	doins "${S}"/fonts/map/dvips/"${MY_P}"/"${MY_P}".map

	latex-package_src_install
}

pkg_postinst() {
	latex-package_rehash
	updmap-sys --enable Map "${MY_P}".map
}

pkg_postrm() {
	updmap-sys --disable "${MY_P}".map
}
