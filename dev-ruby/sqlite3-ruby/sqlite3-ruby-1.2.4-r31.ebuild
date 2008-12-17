# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/sqlite3-ruby/sqlite3-ruby-1.2.1.ebuild,v 1.10 2008/05/12 09:52:28 corsair Exp $

EAPI=2
inherit ruby

DESCRIPTION="An extension library to access a SQLite database from Ruby"
HOMEPAGE="http://rubyforge.org/projects/sqlite-ruby/"
LICENSE="BSD"

SRC_URI="mirror://rubyforge/sqlite-ruby/${P}.tar.bz2"

KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
SLOT="0"
IUSE="doc"

USE_RUBY="ruby18 ruby19 rubyee"
RDEPEND="=dev-db/sqlite-3*"
DEPEND="${RDEPEND}
	dev-lang/swig[ruby]"

src_compile() {
	${RUBY} setup.rb config --prefix=/usr \
		|| die "setup.rb config failed"
	${RUBY} setup.rb setup \
		|| die "setup.rb setup failed"
}

src_install() {
	${RUBY} setup.rb install --prefix="${D}" \
		|| die "setup.rb install failed"

	dodoc README.rdoc CHANGELOG.rdoc

	dohtml doc/faq/faq.html

	if use doc ; then
		dohtml -r -V api
	fi
}
