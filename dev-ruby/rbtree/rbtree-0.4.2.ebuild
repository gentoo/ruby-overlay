# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rbtree/rbtree-0.4.1-r1.ebuild,v 1.1 2013/11/05 00:30:07 mrueg Exp $

EAPI=5
USE_RUBY="ruby18 ruby19 ruby20"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README"

inherit multilib ruby-fakegem

RUBY_FAKEGEM_EXTRAINSTALL="lib/rbtree$(get_modname)"

DESCRIPTION="Ruby/RBTree module."
HOMEPAGE="http://rbtree.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

each_ruby_configure() {
	${RUBY} extconf.rb || die
}

each_ruby_compile() {
	emake V=1

	# Move rbtree.so to lib/ so ruby can load it
	mkdir lib/ || die
	mv rbtree$(get_modname) lib/ || die
}

each_ruby_test() {
	# Make test.rb aware we have moved rbtree.so
	sed -i -e 's/.\/rbtree/lib\/rbtree/g' test.rb || die
	${RUBY} test.rb || die
}
