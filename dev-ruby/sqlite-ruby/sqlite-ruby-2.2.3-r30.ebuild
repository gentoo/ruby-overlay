# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

DESCRIPTION="An extension library to access a SQLite database from Ruby"
HOMEPAGE="http://rubyforge.org/projects/sqlite-ruby/"
LICENSE="BSD"

KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
SLOT="0"
IUSE=""

USE_RUBY="ruby18 ruby19"
DEPEND="=dev-db/sqlite-2*"

GEM_PATCHES="${FILESDIR}/${P}-19compat.patch"
