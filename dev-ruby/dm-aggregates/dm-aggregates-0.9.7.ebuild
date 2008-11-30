# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems
USE_RUBY="ruby18"

DESCRIPTION="DataMapper plugin providing support for aggregates, functions on collections and datasets"
HOMEPAGE="http://github.com/sam/dm-more/tree/master/dm-aggregates"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="=dev-ruby/dm-core-0.9.7"
