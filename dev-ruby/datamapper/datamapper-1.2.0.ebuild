# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

inherit ruby-fakegem

DESCRIPTION="An Object/Relational Mapper for Ruby"
HOMEPAGE="http://datamapper.org/"

RESTRICT="test"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	=dev-ruby/dm-core-1.2.1
	=dev-ruby/dm-aggregates-1.2.0
	=dev-ruby/dm-constraints-1.2.0
	=dev-ruby/dm-migrations-1.2.0
	=dev-ruby/dm-transactions-1.2.0
	=dev-ruby/dm-serializer-1.2.2
	=dev-ruby/dm-timestamps-1.2.0
	=dev-ruby/dm-validations-1.2.0
	=dev-ruby/dm-types-1.2.2"
