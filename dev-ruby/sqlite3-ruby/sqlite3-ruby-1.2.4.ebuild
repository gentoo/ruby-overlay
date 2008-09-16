# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/sqlite3-ruby/sqlite3-ruby-1.1.0.ebuild,v 1.12 2007/07/11 05:23:08 mr_bones_ Exp $

inherit ruby gems

DESCRIPTION="An extension library to access a SQLite database from Ruby"
HOMEPAGE="http://rubyforge.org/projects/sqlite-ruby/"
LICENSE="BSD"

# The URL depends implicitly on the version, unfortunately. Even if you
# change the filename on the end, it still downloads the same file.
SRC_URI="mirror://rubyforge/gems/${P}.gem"

KEYWORDS="~amd64 ~ia64 ~ppc ~sparc ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""

USE_RUBY="ruby18 ruby19"
DEPEND="=dev-db/sqlite-3*"

src_install() {
	gems_src_install
	
	# Fix for upstream bug #21289
	cd "${D}"
	find ./ -perm 0662 -exec chmod 664 {} \;
}
