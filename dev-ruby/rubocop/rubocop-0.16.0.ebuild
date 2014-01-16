# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/timers/timers-1.1.0-r1.ebuild,v 1.1 2013/10/09 01:34:56 mrueg Exp $

EAPI=5

USE_RUBY="ruby19"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Automatic Ruby code style checking tool."
HOMEPAGE="http://github.com/bbatsov/rubocop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/rainbow-1.1.4
	>=dev-ruby/parser-2.1
	>=dev-ruby/powerpack-0.0.6"

each_ruby_install() {
	each_fakegem_install
	ruby_fakegem_doins -r config
}
