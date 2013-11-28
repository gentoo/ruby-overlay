# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_TEST="test"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="File searcher similar to grep but with fancy output"
HOMEPAGE="https://github.com/jpace/glark"

SRC_URI="https://github.com/jpace/glark/archive/v${PV}.tar.gz -> ${PN}-git-${PV}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# About 1/3rd of tests fail due to requirements on external files
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/logue-1.0.0
	>=dev-ruby/ragol-1.0.0
	>=dev-ruby/rainbow-1.1.4
	>=dev-ruby/riel-1.2.0"

all_ruby_prepare() {
	rm -rf doc/ || die
}
