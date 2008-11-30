# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems
USE_RUBY="ruby18"

DESCRIPTION="MailFactory is a pure-ruby MIME mail generator"
HOMEPAGE="http://mailfactory.rubyforge.org"

LICENSE="|| ( Ruby GPL-2 )"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=dev-ruby/mime-types-1.15"
