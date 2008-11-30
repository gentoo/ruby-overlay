# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems
USE_RUBY="ruby18"

DESCRIPTION="Merb plugin that provides support for ActionArgs"
HOMEPAGE="http://merbivore.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
	>=dev-ruby/merb-core-${PV}
	>=dev-ruby/ruby2ruby-1.1.9
	>=dev-ruby/parsetree-2.1.1"
