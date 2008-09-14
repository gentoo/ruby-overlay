# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="An easy to deploy CGI to FCGI wrapper"
HOMEPAGE="http://rubyforge.org/projects/fcgi/"
SRC_URI="mirror://rubyforge/fcgi/${P}.tgz"

KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
LICENSE="Ruby"

DEPEND="dev-libs/fcgi"
RDEPEND="dev-ruby/ruby-fcgi"

IUSE=""

src_install() {
	local siteruby=$(${RUBY} -r rbconfig -e \
		'print Config::CONFIG["sitedir"]')
	insinto ${siteruby}
	doins lib/*.rb || die "doins failed"
}
