# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_TASK_DOC="yard"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.markdown"

inherit ruby-fakegem

DESCRIPTION="Provide a standard and simplified API for communicating with RDBMS from Ruby"
HOMEPAGE="https://github.com/datamapper/do"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/jeweler >=dev-ruby/yard-0.8.7 )"
ruby_add_bdepend "test? (
	dev-ruby/bacon
	dev-ruby/jeweler
	dev-ruby/rspec:2 )"

ruby_add_rdepend ">=dev-ruby/addressable-2.3"

all_ruby_prepare() {
	cp "${FILESDIR}/${PN}.gemspec" "${WORKDIR}/all/${P}/${PN}.gemspec"
}
