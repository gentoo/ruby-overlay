# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby
USE_RUBY="ruby18 ruby19"

DESCRIPTION="A builder to facilitate programatic generation of XML markup"
HOMEPAGE="http://rubyforge.org/projects/builder/"
SRC_URI="mirror://rubyforge/builder/${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

src_compile() {
	true
}

src_install() {
	local siteruby=$(${RUBY} -r rbconfig -e 'print Config::CONFIG["sitelibdir"]')

	insinto ${siteruby}
	doins lib/* || die "doins failed"
	insinto ${siteruby}/builder
	doins lib/builder/* || die "doins failed"

	if use doc; then
		dodoc README doc/releases/* || die "dodoc failed"
	fi
}
