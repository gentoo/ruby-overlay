# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems
USE_RUBY="ruby18"

DESCRIPTION="An Object/Relational Mapper for Ruby"
HOMEPAGE="http://datamapper.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
	>=dev-ruby/data_objects-0.9.5
	>=dev-ruby/extlib-0.9.8
	>=dev-ruby/rspec-1.1.3
	>=dev-ruby/addressable-1.0.4"
