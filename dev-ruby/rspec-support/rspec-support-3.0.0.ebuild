# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rspec-core/rspec-core-2.14.8-r1.ebuild,v 1.2 2014/04/05 22:56:33 mrueg Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 jruby"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_EXTRADOC="Changelog.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A Behaviour Driven Development (BDD) framework for Ruby"
HOMEPAGE="http://rspec.rubyforge.org/"
SRC_URI="https://github.com/rspec/${PN}/archive/v${PV}.tar.gz -> ${P}-git.tgz"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/rspec:3 )"

all_ruby_prepare() {
	# Remove spec that, by following symlinks, tries to scan pretty much
	# the whole filesystem.

	rm spec/rspec/support/caller_filter_spec.rb || die
}
