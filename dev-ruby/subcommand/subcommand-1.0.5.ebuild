# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC="yard"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A tiny wrapper over ruby's awesome OptionParser (standard) which gives easy facility of subcommands."
HOMEPAGE="http://subcommand.rubyforge.org/doc/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

# Tests fail. This should be reported and fixed before moving to main tree.
RESTRICT="test"

ruby_add_bdepend "doc? ( dev-ruby/jeweler dev-ruby/yard )"
ruby_add_bdepend "test? ( dev-ruby/jeweler dev-ruby/rspec )"

# Tests currently run only against the current ruby interpreter. This
# should be fixed before moving this to the main tree.
each_ruby_test() {
	emake test || die
}
