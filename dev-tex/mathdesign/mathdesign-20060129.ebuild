# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit latex-package

FONTS="mdbch mdput mdugm"
SUPPLIER="public"

DESCRIPTION="Free mathematical fonts that match with existing text fonts"
HOMEPAGE="http://www.ctan.org/tex-archive/fonts/mathdesign/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

tex_install() {
	if [ -d "${1}" ] ; then
		pushd "${1}" >/dev/null
		latex-package_src_install
		popd >/dev/null
	fi
}

font_install() {
	local fonttypes="afm tfm type1 vf"
	for ftype in ${fonttypes} ; do
		tex_install "${S}"/fonts/"${ftype}/${PN}/${1}"
	done

	insinto "${TEXMF}"/fonts/map/dvips/"${PN}"
	doins "${S}"/fonts/map/dvips/"${PN}"/"${1}".map

	insinto "${TEXMF}"/dvips/config
	doins "${S}"/dvips/config/config."${1}"

	for i in tex doc ; do
		tex_install "${S}/${i}"/latex/"${PN}/${1}"
	done
}

src_unpack() {
	unpack ${A}
	cd "${S}"

	for i in ${FONTS} mdcore ; do
		unpack ./"${i}".zip
	done
}

src_install() {
	addwrite /var/cache/fonts

	# install top-level documentation
	DOCS="${S}/README"
	latex-package_src_install

	# install core files
	tex_install "${S}"/tex/latex/"${PN}"

	# install fonts
	for font in ${FONTS} ; do
		font_install "${font}"
	done
}

pkg_postinst() {
	latex-package_rehash

	for font in ${FONTS} ; do
		updmap-sys --enable Map "${font}".map
	done
}

pkg_postrm() {
	for font in ${FONTS} ; do
		updmap-sys --disable "${font}".map
	done
}
