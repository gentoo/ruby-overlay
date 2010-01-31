# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

# ruby19 → tests fail, mistake in the examples with Ruby 1.9 syntax
USE_RUBY="ruby18 jruby"

# No tests, unfortunately :(
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_TASK_DOC="doc:rdoc"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem

DESCRIPTION="A wrapper for ncurses 5.x"
HOMEPAGE="http://github.com/seanohalpin/ffi-ncurses"

IUSE=""
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-libs/ncurses"
DEPEND="test? ( sys-libs/ncurses )"

ruby_add_rdepend virtual/ruby-ffi

all_ruby_prepare() {
	# Rakefile tries to call .gitignore file
	# http://github.com/seanohalpin/ffi-ncurses/issues/issue/1
	sed -i \
		-e '/\.gitignore/s:^:#:' \
		Rakefile || die

	# Fix permission on Ruby files
	find . -type f -name '*.rb' -exec chmod -x {} + || die

	# There is no testsuite, but we can possibly use some of the
	# examples to make sure nothing crashes…
	mkdir tests
	for example in example-{attributes,colour,stdscr}.rb; do
		sed -e '/getch/s:^:#:' examples/${example} > tests/${example} || die
	done
}

each_ruby_test() {
	for mytest in tests/*; do
		${RUBY} -Ilib ${mytest} || die "${mytest} failed"
	done
}

all_ruby_install() {
	all_fakegem_install

	docinto examples
	dodoc examples/* || die
}
