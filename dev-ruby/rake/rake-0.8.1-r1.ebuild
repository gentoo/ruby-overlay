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
	ewarn
	ewarn "This version of rake works with Ruby 1.8 only."
	ewarn "Please manually create a symlink in /usr/bin until there is a"
	ewarn "suitable version of eselect-ruby available, ruby-config won't work."
	ewarn
}
