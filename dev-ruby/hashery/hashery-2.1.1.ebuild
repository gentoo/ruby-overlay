# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 jruby"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="The Hashery is a tight collection of Hash-like classes."
HOMEPAGE="http://rubyworks.github.com/hashery"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? (
	dev-ruby/lemon
	dev-ruby/qed
	dev-ruby/rubytest
	dev-ruby/rubytest-cli )"

each_ruby_test() {
	qed || die 'tests failed'
	rubytest -Ilib -Itest test/ || die 'tests failed'
}
