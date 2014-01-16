# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/timers/timers-1.1.0-r1.ebuild,v 1.1 2013/10/09 01:34:56 mrueg Exp $

EAPI=5

USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A library for working with Abstract Syntax Trees."
HOMEPAGE="https://github.com/whitequark/ast"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/bacon )"

all_ruby_prepare() {
	# Remove simplecov/coveralls dependency
	sed -i -e '2,16d' test/helper.rb || die
}

each_ruby_test() {
	${RUBY} -S bacon -Ilib -Itest --automatic --quiet || die
}
