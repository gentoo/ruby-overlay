# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems versionator

# changes 0.7.1.20060406 to 0.7.1.2006.04.06

# ideally, PV would have been this to start with, but can't change it now as
# 0.7.1.20051221 > 0.7.1.2006.04.06.
MY_PV="0.7.9.2008.01.28"
MY_PN="postgres"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="An extension library to access a PostgreSQL database from Ruby"
HOMEPAGE="http://rubyforge.org/projects/ruby-pg"
SRC_URI="mirror://rubyforge/gems/${MY_P}.gem"
LICENSE="Ruby"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""
USE_RUBY="ruby18 ruby19"

RDEPEND="virtual/postgresql-base"
DEPEND="${RDEPEND}
	>=dev-ruby/rubygems-0.9.0-r1"

GEM_PATCHES="${FILESDIR}/${P}-19compat.patch"
