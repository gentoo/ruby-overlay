# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit "ruby"

MY_P=${P##ruby-}

DESCRIPTION="Ruby/DBI - a database independent interface for accessing databases - similar to Perl's DBI"
HOMEPAGE="http://ruby-dbi.rubyforge.org"
SRC_URI="mirror://rubyforge/ruby-dbi/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples odbc postgres mysql sqlite sqlite3"

DEPEND="virtual/ruby"
RDEPEND="${DEPEND}"
PDEPEND="
	mysql?    ( dev-ruby/dbd-mysql )
	postgres? ( dev-ruby/dbd-pg )
	odbc?     ( dev-ruby/dbd-odbc )
	sqlite?   ( dev-ruby/dbd-sqlite )
	sqlite3?  ( dev-ruby/dbd-sqlite3 )"

S="${WORKDIR}/${MY_P}"
USE_RUBY="ruby18 ruby19"

PATCHES="${FILESDIR}/${P}-19compat.patch"

src_install() {
	ruby setup.rb install \
		--prefix="${D}" || die

	dodoc README

	if use examples ; then
		cp -pPR examples "${D}/usr/share/doc/${PF}" || die "cp examples failed"
	fi
}

pkg_postinst() {
	if ! (use mysql || use postgres || use odbc || use sqlite || use sqlite3)
	then
		ewarn
		ewarn "${P} now comes with external database drivers."
		ewarn "Be sure to set the right USE flags for ${PN} or emerge the drivers manually:"
		ewarn "They are called dev-ruby/dbd-{mysql,odbc,pg,sqlite,sqlite3}"
		ewarn
	fi
}
