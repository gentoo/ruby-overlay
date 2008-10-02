# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit "ruby"

DESCRIPTION="The ODBC database driver (DBD) for Ruby/DBI"
HOMEPAGE="http://ruby-dbi.rubyforge.org"
SRC_URI="mirror://rubyforge/ruby-dbi/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/ruby"
RDEPEND="${DPEEND}
	dev-ruby/ruby-odbc
	>=dev-ruby/ruby-dbi-0.4.0"

USE_RUBY="ruby18"

src_install() {
	ruby setup.rb install \
		--prefix="${D}" || die
}

pkg_postinst() {
	ewarn
	ewarn "There is currently no ODBC support for Ruby 1.9!"
	ewarn
}
