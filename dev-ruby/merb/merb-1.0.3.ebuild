# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems
USE_RUBY="ruby18"

DESCRIPTION="A lightweight, fast Ruby MVC framework"
HOMEPAGE="http://merbivore.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
	>=dev-ruby/merb-core-${PV}
	>=dev-ruby/merb-more-${PV}
	>=dev-ruby/dm-core-0.9.7
	>=dev-ruby/do_sqlite3-0.9.7
	>=dev-ruby/dm-timestamps-0.9.7
	>=dev-ruby/dm-types-0.9.7
	>=dev-ruby/dm-aggregates-0.9.7
	>=dev-ruby/dm-migrations-0.9.7
	>=dev-ruby/dm-validations-0.9.7
	>=dev-ruby/dm-sweatshop-0.9.7"
