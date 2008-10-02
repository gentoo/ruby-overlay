# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit "ruby"

DESCRIPTION="The PostgreSQL database driver (DBD) for Ruby/DBI"
HOMEPAGE="http://ruby-dbi.rubyforge.org"
SRC_URI="mirror://rubyforge/ruby-dbi/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/ruby"
RDEPEND="${DEPEND}
	>=dev-ruby/ruby-dbi-0.4.0
	>=dev-ruby/ruby-postgres-0.7.9.20080128"

USE_RUBY="ruby18 ruby19"

src_install() {
	ruby setup.rb install \
		--prefix="${D}" || die
}
