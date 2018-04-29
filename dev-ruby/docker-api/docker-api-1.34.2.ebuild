# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="A simple REST client for the Docker Remote API"
HOMEPAGE="https://github.com/swipely/docker-api"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

# Requires docker to be running to perform live tests
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/excon-0.38.0
	dev-ruby/json
"
