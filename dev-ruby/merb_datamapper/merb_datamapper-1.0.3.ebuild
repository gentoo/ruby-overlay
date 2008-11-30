# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems
USE_RUBY="ruby18"

DESCRIPTION="Merb plugin for the DataMapper ORM"
HOMEPAGE="http://merbivore.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
	>=dev-ruby/dm-core-0.9.6
	>=dev-ruby/dm-migrations-0.9.6
	>=dev-ruby/merb-core-${PV}"
