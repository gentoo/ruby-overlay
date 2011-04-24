# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC="yard"
RUBY_FAKEGEM_DOCDIR="doc"

RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="A tiny wrapper over ruby's awesome OptionParser (standard) which gives easy facility of subcommands."
HOMEPAGE="http://subcommand.rubyforge.org/doc/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

# Tests require dm-do-adapter's spec directory installed.
RESTRICT="test"

ruby_add_bdepend "doc? ( dev-ruby/jeweler dev-ruby/yard )"
ruby_add_bdepend "test? ( dev-ruby/jeweler
	=dev-ruby/rspec-1.3*
	>=dev-ruby/dm-migrations-1.0.0 )"

ruby_add_rdepend ">=dev-ruby/do_sqlite3-0.10.3
	>=dev-ruby/dm-do-adapter-1.0.0"

all_ruby_prepare() {
	sed -i -e '/check_dependencies/d' tasks/spec.rake || die
}
