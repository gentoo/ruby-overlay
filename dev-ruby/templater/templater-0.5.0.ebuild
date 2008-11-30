# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems
USE_RUBY="ruby18"

DESCRIPTION="A powerful code generation framework"
HOMEPAGE="http://templater.rubyforge.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
	>=dev-ruby/highline-1.4.0
	>=dev-ruby/diff-lcs-1.1.2
	>=dev-ruby/extlib-0.9.5"
