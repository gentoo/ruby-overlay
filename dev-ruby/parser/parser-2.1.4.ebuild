# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/timers/timers-1.1.0-r1.ebuild,v 1.1 2013/10/09 01:34:56 mrueg Exp $

EAPI=5

USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A Ruby parser written in pure Ruby."
HOMEPAGE="https://github.com/whitequark/parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/minitest:5 )"
ruby_add_rdepend ">=dev-ruby/ast-1.1 dev-ruby/slop:3"

all_ruby_prepare() {
	# Remove bundler  dependency
	sed -i -e "/require 'bundler\/gem_tasks'/d" Rakefile || die
	# Remove cliver dependency
	sed -i -e "/require 'cliver'/,+1d" Rakefile || die
	# Remove simplecov/coveralls dependency
	sed -i -e "/require 'simplecov'/,+1d" test/helper.rb || die
}
