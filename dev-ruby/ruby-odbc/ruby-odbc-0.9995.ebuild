# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="RubyODBC - For accessing ODBC data sources from the Ruby language"
HOMEPAGE="http://www.ch-werner.de/rubyodbc/"
SRC_URI="http://www.ch-werner.de/rubyodbc/${P}.tar.gz"

LICENSE="|| ( GPL-2 Ruby )"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~sparc ~x86"
USE_RUBY="ruby18"
IUSE="unicode"

DEPEND="=dev-lang/ruby-1.8*
	>=dev-db/unixODBC-2.0.6"

src_compile() {
	# This package needs explicitly ruby18 at configure-time
	export RUBY=/usr/bin/ruby18

	if use unicode ; then
		${RUBY} -Cutf8 extconf.rb
		emake -C utf8
	else
		${RUBY} extconf.rb
		emake
	fi
}

src_install() {
	if use unicode ; then
		ruby_einstall -C utf8
	else
		ruby_einstall
	fi

	dodoc README
	dodoc ChangeLog
	dohtml doc/odbc.html
}

pkg_postinst() {
	elog
	elog "Due to compatibility issues, RubyODBC currently supports Ruby 1.8 only."
	elog
}
