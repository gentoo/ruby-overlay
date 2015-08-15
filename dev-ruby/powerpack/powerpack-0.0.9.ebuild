# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

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
