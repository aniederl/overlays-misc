# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/awesome_print/awesome_print-0.4.0.ebuild,v 1.1 2011/05/23 17:38:12 graaff Exp $

EAPI=3
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_DOCDIR="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.markdown CHANGELOG"

inherit ruby-fakegem

DESCRIPTION="Ruby library that pretty prints Ruby objects in full color with proper indentation."
HOMEPAGE="http://github.com/banister/pry"
LICENSE="MIT"

KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""
