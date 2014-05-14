# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Facets is the premier collection of extension methods for Ruby."
HOMEPAGE="https://rubyworks.github.io/facets/"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? (
	dev-ruby/ae
	dev-ruby/lemon
	dev-ruby/rubytest
	dev-ruby/rubytest-cli )"

all_ruby_prepare() {

	# Remove tests which try and write to /tmp
	rm test/core/file/test_append.rb || die 'test removal failed'
	rm test/core/file/test_create.rb || die 'test removal failed'
	rm test/core/file/test_read_binary.rb || die 'test removal failed'
	rm test/core/file/test_read_list.rb || die 'test removal failed'
	rm test/core/file/test_rewrite.rb || die 'test removal failed'
	rm test/core/file/test_write.rb || die 'test removal failed'
	rm test/core/file/test_writelines.rb || die 'test removal failed'

	# See TODO: https://github.com/rubyworks/facets/blob/2.9.3/test/core/kernel/test_source_location.rb
	rm test/core/kernel/test_source_location.rb || die 'test removal failed'
}

each_ruby_test() {
	rubytest -r lemon -r ae -Ilib/core -Ilib/standard -Itest test/ || die 'tests failed'
}
