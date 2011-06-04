# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

USE_RUBY="ruby18 ruby19"

EAPI="3"
inherit cmake-utils ruby-ng

DESCRIPTION="Ruby bindings for Qt4"
HOMEPAGE="http://rubyforge.org/projects/korundum"
SRC_URI="mirror://rubyforge/korundum/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="assistant phonon qt3support qtscript qscintilla qttest qwt webkit xmlpatterns"

RDEPEND="
	x11-libs/qt-gui[dbus]
	x11-libs/qt-opengl
	x11-libs/qt-sql
	x11-libs/qt-svg
	assistant? ( x11-libs/qt-assistant )
	phonon? ( x11-libs/qt-phonon )
	qt3support? ( x11-libs/qt-qt3support )
	qtscript? ( x11-libs/qt-script )
	qttest? ( x11-libs/qt-test )
	webkit? ( x11-libs/qt-webkit )
	xmlpatterns? ( x11-libs/qt-xmlpatterns )
	qscintilla? ( =x11-libs/qscintilla-2* )
	qwt? ( x11-libs/qwt:5 )"
DEPEND="${RDEPEND}"

# Dev notes:
# Check the CMakeLists for optional components and automagic dependencies!
# I'm not sure if the QT_USE_* options below actually work...
# Also, make sure we are multilib compatible.
# USE=qwt fails... but it's optional now.
# This currently also installs Qt.rb and Qt3.rb, but i think we only want
# Qt4.rb.

each_ruby_prepare() {
	# inject dependency on smokegen / libgenerator_smoke
	for i in smoke/*/CMakeLists.txt ; do
		if grep -q '^add_library' ${i} ; then
			local target="$(sed -ne 's:^add_library(\([^ ]\+\).*$:\1:p' ${i})"
			echo "add_dependencies(${target} smokegen generator_smoke)" >> ${i}
		fi
	done
	sed -i -e '/# SET(_RUBY_DEBUG_OUTPUT TRUE)/ s:# ::' cmake/modules/FindRuby.cmake || die "sed"
}

CMAKE_IN_SOURCE_BUILD="true"

each_ruby_configure() {
	# need to build it for every required ruby version
	CMAKE_USE_DIR="${S}"

	local mycmakeargs=
	mycmakeargs="${mycmakeargs}
	-DRUBY_EXECUTABLE=${RUBY}
	-DRUBY_LIBRARY=$(ruby_get_libruby)
	-DENABLE_QTRUBY=on
	-DENABLE_SMOKE=on
	-DENABLE_SMOKEKDE=off
	-DQT_USE_QTDESIGNER=true
	$(cmake-utils_use assistant QT_USE_QTASSISTANT)
	$(cmake-utils_use assistant QT_USE_QTASSISTANTCLIENT)
	$(cmake-utils_use phonon QT_USE_PHONON)
	$(cmake-utils_use_enable phonon PHONON_RUBY)
	$(cmake-utils_use_enable phonon PHONON_SMOKE)
	$(cmake-utils_use qt3support QT_USE_QT3SUPPORT)
	$(cmake-utils_use_enable qtscript QTSCRIPT)
	$(cmake-utils_use_enable qtscript QTSCRIPT-SMOKE)
	$(cmake-utils_use_enable qttest QTTEST)
	$(cmake-utils_use_enable qttest QTTEST-SMOKE)
	$(cmake-utils_use_enable webkit QTWEBKIT_RUBY)
	$(cmake-utils_use_enable webkit QTWEBKIT_SMOKE)
	$(cmake-utils_use xmlpatterns QT_USE_QTXMLPATTERNS)
	$(cmake-utils_use_enable qscintilla QSCINTILLA_RUBY)
	$(cmake-utils_use_enable qscintilla QSCI-SMOKE)
	$(cmake-utils_use_enable qwt QWT_RUBY)
	$(cmake-utils_use_enable qwt QWT-SMOKE)
	-Wno-dev"

	cmake-utils_src_configure
}

each_ruby_compile() {
	CMAKE_USE_DIR="${S}"
	cmake-utils_src_compile
}

each_ruby_install() {
	CMAKE_USE_DIR="${S}"
	cmake-utils_src_install
}
