# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_TASK_DOC="yard"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.markdown"

inherit ruby-fakegem

DESCRIPTION="Implements the DataObjects API for Sqlite3"
HOMEPAGE="http://datamapper.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND+="dev-db/sqlite:3"

ruby_add_bdepend "doc? ( >=dev-ruby/yard-0.8.7 )"
ruby_add_bdepend "test? ( dev-ruby/rake-compiler dev-ruby/rspec:2 )"

ruby_add_rdepend "dev-ruby/data_objects"

all_ruby_prepare() {
	cp "${FILESDIR}/${PN}.gemspec" "${WORKDIR}/all/${P}/${PN}.gemspec"
}
