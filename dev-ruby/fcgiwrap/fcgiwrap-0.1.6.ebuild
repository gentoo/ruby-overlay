# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby
USE_RUBY="ruby18 ruby19"

DESCRIPTION="An easy to deploy CGI to FCGI wrapper"
HOMEPAGE="http://rubyforge.org/projects/fcgi/"
SRC_URI="mirror://rubyforge/fcgi/${P}.tgz"

KEYWORDS="~amd64 ~x86"
LICENSE="|| ( Ruby GPL-2 )"
IUSE=""

RDEPEND="dev-ruby/ruby-fcgi"

src_install() {
	local siteruby=$(${RUBY} -r rbconfig -e \
		'print Config::CONFIG["sitedir"]')
	insinto ${siteruby}
	doins lib/*.rb || die "doins failed"
}
