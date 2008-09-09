# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rake/rake-0.8.1.ebuild,v 1.9 2008/04/17 10:53:49 armin76 Exp $

inherit gems

DESCRIPTION="Make-like scripting in Ruby"
HOMEPAGE="http://rake.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""
RESTRICT="test"

USE_RUBY="ruby18"

src_install() {
	gems_src_install

	# Rename rake -> rake18 as ruby 1.9 ships with its own rake
	mv "${D}/usr/bin/rake" "${D}/usr/bin/rake18" || die "Couldn't rename rake"
}

pkg_postinst() {
	if [[ ! -n $(readlink "${ROOT}"usr/bin/rake) ]] ; then
		eselect ruby set ruby18
	fi

	ewarn
	ewarn "This ebuild is compatible to eselect-ruby"
	ewarn "To switch between available Ruby profiles, execute as root:"
	ewarn "\teselect ruby set ruby(18|19|...)"
	ewarn
}
