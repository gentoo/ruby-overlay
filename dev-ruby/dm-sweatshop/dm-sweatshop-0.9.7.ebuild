# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems
USE_RUBY="ruby18"

DESCRIPTION="DataMapper plugin for building pseudo random models"
HOMEPAGE="http://github.com/sam/dm-more/tree/master/dm-sweatshop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
	=dev-ruby/dm-core-${PV}
	dev-ruby/randexp"
