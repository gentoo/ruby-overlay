# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/simple-rss/simple-rss-1.2.3-r2.ebuild,v 1.1 2013/07/25 12:59:33 graaff Exp $

EAPI=5
USE_RUBY="ruby18 ruby19 ruby20 jruby"

RUBY_FAKEGEM_TASK_DOC="doc"
RUBY_FAKEGEM_EXTRADOC="README.markdown"

inherit ruby-fakegem

DESCRIPTION="Simple RSS is a simple, flexible, extensible, and liberal RSS and
Atom reader for Ruby."
HOMEPAGE="http://simple-rss.rubyforge.org/"
LICENSE="LGPL-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/rspec )"

all_ruby_prepare() {
	# Avoid dependency on bundler
	sed -i -e '/bundler/d' Rakefile || die

	# https://github.com/cardmagic/simple-rss/pull/14
	sed -i -e 's/README/README.markdown/' Rakefile || die
}
