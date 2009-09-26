# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit latex-package

FONTS="mdbch mdput mdugm"
SUPPLIER="public"

MY_URI="http://www.ctan.org/get/fonts/mathdesign"

DESCRIPTION="Free mathematical fonts that match with existing text fonts"
HOMEPAGE="http://www.ctan.org/tex-archive/fonts/mathdesign/"
SRC_URI="${MY_URI}/MD-adobe-utopia-doc.pdf
         ${MY_URI}/MD-adobe-utopia-example.pdf
         ${MY_URI}/MD-bitstream-charter-doc.pdf
         ${MY_URI}/MD-bitstream-charter-example.pdf
         ${MY_URI}/MD-urw-garamond-example.pdf
         ${MY_URI}/README
         ${MY_URI}/mathdesign-doc.pdf
         ${MY_URI}/mdbch.zip
         ${MY_URI}/mdcore.zip
         ${MY_URI}/mdput.zip
         ${MY_URI}/mdugm.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

RESTRICT="mirror"

S="${WORKDIR}"

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
	cd "${S}"

	for src in ${A} ; do
		cp "${DISTDIR}"/${src} . || die "cp failed"
	done

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
