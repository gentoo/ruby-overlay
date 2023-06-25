# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A simple REST client for the Docker Remote API"
HOMEPAGE="https://github.com/upserve/docker-api"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

# Requires docker to be running to perform live tests
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/excon-0.47.0
	dev-ruby/multi_json
"
