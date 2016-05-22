# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Wrapper for the RubyGems.org API"
HOMEPAGE="https://github.com/rubygems/gems"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/webmock )"

all_ruby_prepare() {
	sed -i -e '/simplecov/,/SimpleCov.start/ s:^:#:' spec/helper.rb || die
}
