# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/syntax/syntax-1.0.0-r1.ebuild,v 1.2 2009/12/23 12:28:51 flameeyes Exp $

EAPI=2

# jruby → “fork is unsafe and disabled by default on JRuby“
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="HISTORY README TODO"

inherit ruby-fakegem

DESCRIPTION="A set of classes to drive external programs via pipe"
HOMEPAGE="http://codeforpeople.com/lib/ruby/session/"
SRC_URI="http://codeforpeople.com/lib/ruby/session/${P}.tgz"

LICENSE="as-is" # actually no license information provided :(
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend test virtual/ruby-test-unit

each_ruby_test() {
	${RUBY} -Ilib test/*.rb || die "tests failed"
}

all_ruby_install() {
	all_fakegem_install

	docinto examples
	dodoc sample/* || die
}
