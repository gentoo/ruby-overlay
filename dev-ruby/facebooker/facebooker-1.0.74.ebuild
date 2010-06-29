# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_TEST="test"
RUBY_FAKEGEM_TASK_DOC="docs"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc TODO.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="generators rails templates init.rb"

inherit ruby-fakegem versionator

DESCRIPTION="Ruby wrapper over the Facebook REST API"
HOMEPAGE="http://facebooker.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/json"
ruby_add_bdepend "
	test? (
		virtual/ruby-test-unit
		dev-ruby/rails
		dev-ruby/mocha
		dev-ruby/hoe
		dev-ruby/flexmock
	)
	doc? ( dev-ruby/hoe )"

DEPEND="${DEPEND}
	doc? ( media-gfx/graphviz )"

each_ruby_test() {
	local rails_cpv=$(best_version =dev-ruby/rails-2*)
	export RAILS_VERSION=$(get_version_component_range 1-3 ${rails_cpv#*/rails-})

	each_fakegem_test
}

all_ruby_install() {
	all_fakegem_install

	insinto /usr/share/doc/${PF}/examples
	doins examples/* || die
}
