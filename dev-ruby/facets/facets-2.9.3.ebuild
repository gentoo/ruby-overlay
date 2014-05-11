# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Facets is the premier collection of extension methods for Ruby."
HOMEPAGE="https://rubyworks.github.io/facets/"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Tests cause circular dependencies with dev-ruby/qed
RESTRICT="test"
