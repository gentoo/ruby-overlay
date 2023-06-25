# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_RECIPE_DOC="none"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"

inherit ruby-fakegem

DESCRIPTION="A lightweight database toolkit for Ruby"
HOMEPAGE="https://sequel.jeremyevans.net/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Unpackaged dependencies
RESTRICT="test"
