# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: Andreas Niederl
# Purpose: vim-plugin wrapper eclass for plugins in overlay
#

VIM_PLUGIN1_SRC_URI="${SRC_URI}"
inherit vim-plugin
SRC_URI="${VIM_PLUGIN1_SRC_URI}"

EXPORT_FUNCTIONS src_unpack

RESTRICT="mirror"

for x in "${A}" ; do
	case "${x}" in
		*.zip)
			DEPEND="app-arch/unzip"
			;;
	esac
	break
done


unpack-vimball() {
	local vimball="${1}"

	if [[ "${1}" == *.gz ]] ; then
		vimball="${vimball%.gz}"
		vimball="${T}/${vimball##*/}"
		gunzip -c "${1}" > "${vimball}"
	fi

	if ! head -n 1 "${vimball}" | grep -q '^" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.$' ; then
		die "${vimball} does not seem to be a Vimball!"
	fi

	local filelines="$(grep -n '\[\[\[' "${vimball}" | cut -d : -f 1 | tr '\n' ' ')"
	for linenr in ${filelines} ; do
		local filename="$(sed -ne ${linenr}' s:\t\[\[\[1$::p' ${vimball})"
		local filelength="$(sed -ne $((linenr + 1))' p' ${vimball})"
		local filedir="$(dirname ${filename})"

		[[ ! -d "${filedir}" ]] && mkdir -p "${filedir}"

		sed -ne $((linenr + 2)),$((linenr + 2 + filelength - 1))' p' "${vimball}" > "${filename}"
	done
}

VCDIR="${VCDIR:-plugin}"
my-unpack() {
	local x
	for x in "${@}" ; do
		case "${x}" in
			*.vim)
				mkdir -p "${VCDIR}"
				# per policy vim-plugin1_src_unpack shall only be used for ${P}.vim -> ${PN}.vim
				cp "${DISTDIR}/${x}" "${VCDIR}/${PN}.vim" || die "cp failed"
				;;
			*.vba|*.vba.gz)
				unpack-vimball "${DISTDIR}/${x}"
				;;
			*)
				unpack "${x}"
				;;
		esac
	done
}

vim-plugin1_src_unpack() {
	my-unpack ${A}
	cd "${S}"
}


