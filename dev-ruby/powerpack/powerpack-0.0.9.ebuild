# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/timers/timers-1.1.0-r1.ebuild,v 1.1 2013/10/09 01:34:56 mrueg Exp $

EAPI=5

USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A few useful extensions to core Ruby classes."
HOMEPAGE="https://github.com/bbatsov/powerpack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
